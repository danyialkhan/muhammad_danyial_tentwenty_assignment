import 'package:dartz/dartz.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/errors/failures.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/generes/usecases/get_generes.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_details.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/usecases/get_upcoming_movies_list.dart';

abstract class Repository {
  /// This method will gets the list of all upcoming moves
  /// Input: [params] contains api key, page no, language.
  /// Output: If successful returns [UpComingMovies] List of upcoming [Movie] and other meta data.
  /// If unsuccessful returns [Failure]
  Future<Either<Failure, UpComingMovies>> getUpComingMovies(GetUpComingMoviesListParams params);

  /// This method will gets the details of movie against the provided id.
  /// Input: [params] contains movie id.
  /// Output: If successful returns [MovieDetails] details of the movie.
  /// If unsuccessful returns [Failure]
  Future<Either<Failure, MovieDetails>> getMovieDetails(GetMovieDetailsParams params);

  /// This method will gets the list of all genres
  /// Output: If successful returns [Genres] list of the genre.
  /// may throw exception.
  Future<Either<Failure, Genres>> getGenres();
}
