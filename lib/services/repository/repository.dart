import 'package:dartz/dartz.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/errors/failures.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/generes/usecases/get_generes.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_details.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_images.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_videos.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/usecases/get_upcoming_movies_list.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/search_movies/usecases/search_movie.dart';

abstract class Repository {
  /// This method will gets the list of all upcoming moves
  /// Input: [params] contains api key, page no, language.
  /// Output: If successful returns [MoviesList] List of upcoming [Movie] and other meta data.
  /// If unsuccessful returns [Failure]
  Future<Either<Failure, MoviesList>> getUpComingMovies(GetUpComingMoviesListParams params);

  /// This method will gets the details of movie against the provided id.
  /// Input: [params] contains movie id.
  /// Output: If successful returns [MovieDetails] details of the movie.
  /// If unsuccessful returns [Failure]
  Future<Either<Failure, MovieDetails>> getMovieDetails(GetMovieDetailsParams params);

  /// This method will gets the list of all genres
  /// Output: If successful returns [Genres] list of the genre.
  /// If unsuccessful returns [Failure]
  Future<Either<Failure, Genres>> getGenres();

  /// This method will search the movies against the provided query
  /// Input: [params] contains query.
  /// Output: If successful returns [MoviesList] List of upcoming [Movie] and other meta data.
  /// If unsuccessful returns [Failure]
  Future<Either<Failure, MoviesList>> searchMovie(SearchMoviesParams params);

  /// This method will gets all images of the movie
  /// Input: [params] image id.
  /// Output: If successful returns [MovieImages] contains list of [Backdrop].
  /// If unsuccessful returns [Failure]
  Future<Either<Failure, MovieImages>> getMovieImages(int params);

  /// This method will gets all videos of the movie
  /// Input: [params] movie id.
  /// Output: If successful returns [MovieVideos] contains list of [MovieVideo].
  /// If unsuccessful returns [Failure]
  Future<Either<Failure, MovieVideos>> getMovieVideos(int params);
}
