import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/errors/failures.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/usecases/usecase.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/generes/usecases/get_generes.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/usecases/get_upcoming_movies_list.dart';

part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final GetMovieGenre _getMovieGenre;
  GenreBloc({required GetMovieGenre getMovieGenre})
      : _getMovieGenre = getMovieGenre,
        super(GenreState.initial()) {
    on<GetAllGenresEvent>(_onGetAllGenres);
    on<OnSearchChangedEvent>(_onSearchChangedEvent);
    on<OnTapCrossEvent>(_onTapCross);
  }

  TextEditingController controller = TextEditingController();

  FutureOr<void> _onGetAllGenres(GetAllGenresEvent event, Emitter<GenreState> emit) async {
    emit(state.copyWith(fetching: true, failureEither: right(unit)));

    final resultEither = await _getMovieGenre(NoParams());

    if (resultEither.isLeft()) {
      final failure = handleFailure(resultEither);
      emit(state.copyWith(fetching: false, failureEither: left(failure)));
      return;
    }

    final response = resultEither.getOrElse(() => const Genres(genres: []));

    emit(state.copyWith(fetching: false, failureEither: right(unit), genres: [...response.genres]));
  }

  FutureOr<void> _onSearchChangedEvent(OnSearchChangedEvent event, Emitter<GenreState> emit) async {}

  FutureOr<void> _onTapCross(OnTapCrossEvent event, Emitter<GenreState> emit) async {
    controller.clear();
    emit(GoBackState(state: state.copyWith(movies: [])));
  }
}