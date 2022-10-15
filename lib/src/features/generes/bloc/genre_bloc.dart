import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/errors/failures.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/usecases/usecase.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/generes/usecases/get_generes.dart';

part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final GetMovieGenre _getMovieGenre;
  GenreBloc({required GetMovieGenre getMovieGenre})
      : _getMovieGenre = getMovieGenre,
        super(GenreState.initial()) {
    on<GetAllGenresEvent>(_onGetAllGenres);
  }

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
}
