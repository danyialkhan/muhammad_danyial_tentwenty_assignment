part of 'genre_bloc.dart';

class GenreState {
  final bool fetching;
  final Either<Failure, Unit> failureEither;
  final List<Genre> genres;
  GenreState({
    required this.fetching,
    required this.failureEither,
    required this.genres,
  });

  factory GenreState.initial() => GenreState(
        failureEither: right(unit),
        fetching: false,
        genres: [],
      );

  GenreState copyWith({
    bool? fetching,
    Either<Failure, Unit>? failureEither,
    List<Genre>? genres,
  }) {
    return GenreState(
      genres: genres ?? this.genres,
      fetching: fetching ?? this.fetching,
      failureEither: failureEither ?? this.failureEither,
    );
  }
}
