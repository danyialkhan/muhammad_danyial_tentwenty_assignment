part of 'genre_bloc.dart';

class GenreState {
  final bool fetching;
  final Either<Failure, Unit> failureEither;
  final List<Genre> genres;
  final List<Movie> movies;

  GenreState({
    required this.fetching,
    required this.failureEither,
    required this.genres,
    required this.movies,
  });

  factory GenreState.initial() => GenreState(
        failureEither: right(unit),
        fetching: false,
        genres: [],
        movies: [],
      );

  GenreState copyWith({
    bool? fetching,
    Either<Failure, Unit>? failureEither,
    List<Genre>? genres,
    List<Movie>? movies,
  }) {
    return GenreState(
      genres: genres ?? this.genres,
      fetching: fetching ?? this.fetching,
      failureEither: failureEither ?? this.failureEither,
      movies: movies ?? this.movies,
    );
  }
}

class GoBackState extends GenreState {
  GoBackState({required GenreState state})
      : super(
          genres: state.genres,
          failureEither: state.failureEither,
          fetching: state.fetching,
          movies: state.movies,
        );
}
