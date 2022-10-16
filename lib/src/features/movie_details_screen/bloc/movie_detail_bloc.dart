import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/errors/failures.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_details.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_images.dart';

part 'movie_detail_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetails _getMovieDetails;
  final GetMovieImages _getMovieImages;
  MovieDetailsBloc({
    required GetMovieDetails getMovieDetails,
    required GetMovieImages getMovieImages,
  })  : _getMovieDetails = getMovieDetails,
        _getMovieImages = getMovieImages,
        super(MovieDetailsState.initial()) {
    on<GetMovieDetailsEvent>(_onGetMovieDetails);
  }

  FutureOr<void> _onGetMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {

    emit(state.copyWith(fetching: true, failureEither: right(unit)));

    final resultEither = await _getMovieDetails(GetMovieDetailsParams(event.id));

    if(resultEither.isLeft()) {
      final failure = handleFailure(resultEither);
      emit(state.copyWith(fetching: false, failureEither: left(failure)));
      return;
    }

    final response = resultEither.getOrElse(() => MovieDetails.empty());
    emit(state.copyWith(fetching: false, movieDetails: response));
  }
}
