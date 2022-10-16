import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/errors/failures.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/repository/repository.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/usecases/usecase.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/usecases/get_upcoming_movies_list.dart';

/// This use case will search the movies against the provided query
/// Input: [SearchMoviesParams] contains query.
/// Output: If successful returns [MoviesList] List of upcoming [Movie] and other meta data.
/// If unsuccessful returns [Failure]
class SearchMovies extends UseCase<MoviesList, SearchMoviesParams> {
  final Repository repository;

  SearchMovies(this.repository);
  @override
  Future<Either<Failure, MoviesList>> call(SearchMoviesParams params) async {
    return repository.searchMovie(params);
  }
}

class SearchMoviesParams extends Equatable {
  final String query;
  final int page;
  const SearchMoviesParams({required this.query, required this.page});

  @override
  List<Object?> get props => [query, page];
}
