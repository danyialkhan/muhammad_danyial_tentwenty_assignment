import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/errors/failures.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_details.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_images.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_videos.dart';

part 'movie_detail_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetails _getMovieDetails;
  final GetMovieImages _getMovieImages;
  final GetMovieVideos _getMovieVideos;
  MovieDetailsBloc({
    required GetMovieDetails getMovieDetails,
    required GetMovieImages getMovieImages,
    required GetMovieVideos getMovieVideos,
  })  : _getMovieDetails = getMovieDetails,
        _getMovieImages = getMovieImages,
        _getMovieVideos = getMovieVideos,
        super(MovieDetailsState.initial()) {
    on<GetMovieDetailsEvent>(_onGetMovieDataEvent);
    on<GetMovieVideosEvent>(_onGetMovieVideosEvent);
    on<GetMovieImagesEvent>(_onGetMovieImagesEvent);
  }

  FutureOr<void> _onGetMovieDataEvent(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    emit(state.copyWith(fetching: true, failureEither: right(unit)));

    final resultEither = await _getMovieDetails(GetMovieDetailsParams(event.id));

    if (resultEither.isLeft()) {
      final failure = handleFailure(resultEither);
      emit(state.copyWith(fetching: false, failureEither: left(failure)));
      return;
    }

    final response = resultEither.getOrElse(() => MovieDetails.empty());
    emit(state.copyWith(fetching: false, movieDetails: response));
  }

  FutureOr<void> _onGetMovieVideosEvent(GetMovieVideosEvent event, Emitter<MovieDetailsState> emit) async {
    emit(state.copyWith(fetchingVideos: true, getMovieVideosFailureEither: right(unit)));

    final resultEither = await _getMovieVideos(event.id);

    if (resultEither.isLeft()) {
      final failure = handleFailure(resultEither);
      emit(state.copyWith(fetchingVideos: false, getMovieVideosFailureEither: left(failure)));
      return;
    }

    final response = resultEither.getOrElse(() => MovieVideos.empty());
    emit(state.copyWith(fetchingVideos: false, movieVideos: response));
  }

  FutureOr<void> _onGetMovieImagesEvent(GetMovieImagesEvent event, Emitter<MovieDetailsState> emit) async {
    emit(state.copyWith(fetchingImages: true, getMovieImagesFailureEither: right(unit)));

    final resultEither = await _getMovieImages(event.id);

    if (resultEither.isLeft()) {
      final failure = handleFailure(resultEither);
      emit(state.copyWith(fetchingImages: false, getMovieImagesFailureEither: left(failure)));
      return;
    }

    final response = resultEither.getOrElse(() => MovieImages.empty());
    emit(state.copyWith(fetchingImages: false, movieImages: response));
  }
}
