part of 'movie_detail_bloc.dart';

class MovieDetailsState {
  final MovieDetails movieDetails;
  final MovieVideos movieVideos;
  final MovieImages movieImages;
  final bool fetching;
  final bool fetchingVideos;
  final bool fetchingImages;
  final Either<Failure, Unit> failureEither;
  final Either<Failure, Unit> getMovieVideosFailureEither;
  final Either<Failure, Unit> getMovieImagesFailureEither;

  MovieDetailsState({
    required this.movieDetails,
    required this.fetching,
    required this.failureEither,
    required this.movieVideos,
    required this.getMovieVideosFailureEither,
    required this.getMovieImagesFailureEither,
    required this.fetchingVideos,
    required this.fetchingImages,
    required this.movieImages,
  });

  factory MovieDetailsState.initial() => MovieDetailsState(
        fetching: false,
        fetchingVideos: false,
        fetchingImages: false,
        failureEither: right(unit),
        getMovieVideosFailureEither: right(unit),
        getMovieImagesFailureEither: right(unit),
        movieDetails: MovieDetails.empty(),
        movieVideos: MovieVideos.empty(),
        movieImages: MovieImages.empty(),
      );

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    MovieVideos? movieVideos,
    MovieImages? movieImages,
    bool? fetching,
    bool? fetchingImages,
    bool? fetchingVideos,
    Either<Failure, Unit>? failureEither,
    Either<Failure, Unit>? getMovieVideosFailureEither,
    Either<Failure, Unit>? getMovieImagesFailureEither,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      failureEither: failureEither ?? this.failureEither,
      fetching: fetching ?? this.fetching,
      movieVideos: movieVideos ?? this.movieVideos,
      movieImages: movieImages ?? this.movieImages,
      getMovieVideosFailureEither: getMovieVideosFailureEither ?? this.getMovieVideosFailureEither,
      fetchingVideos: fetchingVideos ?? this.fetchingVideos,
      fetchingImages: fetchingImages ?? this.fetchingImages,
      getMovieImagesFailureEither: getMovieImagesFailureEither ?? this.getMovieImagesFailureEither,
    );
  }
}
