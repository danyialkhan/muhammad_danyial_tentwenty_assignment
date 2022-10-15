part of 'upcomming_movies_bloc.dart';

class UpComingMoviesState {
  final MoviesList moviesList;
  final bool fetching;
  final Either<Failure, Unit> failureEither;

  UpComingMoviesState({
    required this.moviesList,
    required this.fetching,
    required this.failureEither,
  });

  factory UpComingMoviesState.initial() => UpComingMoviesState(
        moviesList: MoviesList.empty(),
        fetching: false,
        failureEither: right(unit),
      );

  UpComingMoviesState copyWith({
    MoviesList? moviesList,
    bool? fetching,
    Either<Failure, Unit>? failureEither,
  }) {
    return UpComingMoviesState(
      fetching: fetching ?? this.fetching,
      moviesList: moviesList ?? this.moviesList,
      failureEither: failureEither ?? this.failureEither,
    );
  }
}
