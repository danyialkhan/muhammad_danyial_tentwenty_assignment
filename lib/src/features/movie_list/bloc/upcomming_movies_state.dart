part of 'upcomming_movies_bloc.dart';

class UpComingMoviesState {
  final MoviesList moviesList;
  final bool fetching;
  final bool fetchingNextPage;
  final List<Movie> results;
  final int totalPages;
  final int currentPage;
  final Either<Failure, Unit> failureEither;

  UpComingMoviesState({
    required this.moviesList,
    required this.fetching,
    required this.failureEither,
    required this.results,
    required this.totalPages,
    required this.currentPage,
    required this.fetchingNextPage,
  });

  factory UpComingMoviesState.initial() => UpComingMoviesState(
        moviesList: MoviesList.empty(),
        fetching: false,
        fetchingNextPage: false,
        failureEither: right(unit),
        currentPage: 1,
        results: [],
        totalPages: 1,
      );

  UpComingMoviesState copyWith({
    MoviesList? moviesList,
    bool? fetching,
    bool? fetchingNextPage,
    Either<Failure, Unit>? failureEither,
    List<Movie>? results,
    int? totalPages,
    int? currentPage,
  }) {
    return UpComingMoviesState(
      fetching: fetching ?? this.fetching,
      moviesList: moviesList ?? this.moviesList,
      failureEither: failureEither ?? this.failureEither,
      totalPages: totalPages ?? this.totalPages,
      results: results ?? this.results,
      currentPage: currentPage ?? this.currentPage,
      fetchingNextPage: fetchingNextPage ?? this.fetchingNextPage,
    );
  }
}
