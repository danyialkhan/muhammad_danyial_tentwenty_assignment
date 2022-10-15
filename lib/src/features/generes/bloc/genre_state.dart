part of 'genre_bloc.dart';

class GenreState {
  final bool fetching;
  final bool searchingMovies;
  final Either<Failure, Unit> failureEither;
  final List<Genre> genres;
  final List<Movie> movies;
  final String currentScreen;

  GenreState({
    required this.fetching,
    required this.failureEither,
    required this.genres,
    required this.movies,
    required this.searchingMovies,
    required this.currentScreen,
  });

  factory GenreState.initial() => GenreState(
        failureEither: right(unit),
        fetching: false,
        searchingMovies: false,
        genres: [],
        movies: [],
        currentScreen: WatchTabRoutes.genreScreen,
      );

  GenreState copyWith({
    bool? fetching,
    bool? searchingMovies,
    String? currentScreen,
    Either<Failure, Unit>? failureEither,
    List<Genre>? genres,
    List<Movie>? movies,
  }) {
    return GenreState(
      genres: genres ?? this.genres,
      fetching: fetching ?? this.fetching,
      failureEither: failureEither ?? this.failureEither,
      movies: movies ?? this.movies,
      searchingMovies: searchingMovies ?? this.searchingMovies,
      currentScreen: currentScreen ?? this.currentScreen,
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
          searchingMovies: state.searchingMovies,
          currentScreen: state.currentScreen,
        );
}

class GoToSearchScreenState extends GenreState {
  GoToSearchScreenState({required GenreState state})
      : super(
          genres: state.genres,
          failureEither: state.failureEither,
          fetching: state.fetching,
          movies: state.movies,
          searchingMovies: state.searchingMovies,
          currentScreen: state.currentScreen,
        );
}
