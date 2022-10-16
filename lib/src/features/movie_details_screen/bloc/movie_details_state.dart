part of 'movie_detail_bloc.dart';

class MovieDetailsState {
  final MovieDetails movieDetails;
  final bool fetching;
  final Either<Failure, Unit> failureEither;

  MovieDetailsState({
    required this.movieDetails,
    required this.fetching,
    required this.failureEither,
  });

  factory MovieDetailsState.initial() => MovieDetailsState(
        fetching: false,
        failureEither: right(unit),
        movieDetails: MovieDetails.empty(),
      );

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    bool? fetching,
    Either<Failure, Unit>? failureEither,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      failureEither: failureEither ?? this.failureEither,
      fetching: fetching ?? this.fetching,
    );
  }
}
