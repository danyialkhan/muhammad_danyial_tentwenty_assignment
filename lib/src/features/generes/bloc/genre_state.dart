part of 'genre_bloc.dart';

class GenreState {
  final bool fetching;
  final bool searchingMovies;
  final bool searchingMoviesNextPage;
  final Either<Failure, Unit> failureEither;
  final List<Genre> genres;
  final List<Movie> movies;
  final String currentScreen;
  final String currentQuery;
  final int totalPages;
  final int currentPage;
  final int totalResults;

  GenreState({
    required this.fetching,
    required this.failureEither,
    required this.genres,
    required this.movies,
    required this.searchingMovies,
    required this.currentScreen,
    required this.searchingMoviesNextPage,
    required this.totalPages,
    required this.currentPage,
    required this.currentQuery,
    required this.totalResults,
  });

  factory GenreState.initial() => GenreState(
        failureEither: right(unit),
        fetching: false,
        searchingMovies: false,
        searchingMoviesNextPage: false,
        genres: [],
        movies: [],
        currentScreen: WatchTabRoutes.genreScreen,
        totalPages: 1,
        currentPage: 1,
        totalResults: 1,
        currentQuery: '',
      );

  GenreState copyWith({
    bool? fetching,
    bool? searchingMovies,
    bool? searchingMoviesNextPage,
    String? currentScreen,
    String? currentQuery,
    Either<Failure, Unit>? failureEither,
    List<Genre>? genres,
    List<Movie>? movies,
    int? totalPages,
    int? currentPage,
    int? totalResults,
  }) {
    return GenreState(
      genres: genres ?? this.genres,
      fetching: fetching ?? this.fetching,
      failureEither: failureEither ?? this.failureEither,
      movies: movies ?? this.movies,
      searchingMovies: searchingMovies ?? this.searchingMovies,
      currentScreen: currentScreen ?? this.currentScreen,
      searchingMoviesNextPage: searchingMoviesNextPage ?? this.searchingMoviesNextPage,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
      currentQuery: currentQuery ?? this.currentQuery,
      totalResults: totalResults ?? this.totalResults,
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
          searchingMoviesNextPage: state.searchingMoviesNextPage,
          currentPage: state.currentPage,
          totalPages: state.totalPages,
          currentQuery: state.currentQuery,
          totalResults: state.totalResults,
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
          searchingMoviesNextPage: state.searchingMoviesNextPage,
          currentPage: state.currentPage,
          totalPages: state.totalPages,
          currentQuery: state.currentQuery,
          totalResults: state.totalResults,
        );
}
