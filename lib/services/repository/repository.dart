import 'package:dartz/dartz.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/errors/failures.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/usecases/get_upcoming_movies_list.dart';

abstract class Repository {
  /// This method will gets the list of all upcoming moves
  /// Input: [params] contains api key, page no, language.
  /// Output: If successful returns [UpComingMovies] List of upcoming [Movie] and other meta data.
  /// If unsuccessful returns [Failure]
  Future<Either<Failure, UpComingMovies>> getUpComingMovies(GetUpComingMoviesListParams params);
}
