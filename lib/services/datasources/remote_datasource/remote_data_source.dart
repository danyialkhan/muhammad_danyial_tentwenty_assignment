import 'package:muhammad_danyial_tentwenty_assignment/src/features/generes/usecases/get_generes.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_details.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/usecases/get_upcoming_movies_list.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/search_movies/usecases/search_movie.dart';

abstract class RemoteDataSource {
  /// This method will gets the list of all upcoming moves
  /// Input: [params] contains api key, page no, language.
  /// Output: If successful returns [MoviesList] List of upcoming [Movie] and other meta data.
  /// may throw exception.
  Future<MoviesList> getUpComingMovies(GetUpComingMoviesListParams params);

  /// This method will gets the details of movie against the provided id.
  /// Input: [params] contains movie id.
  /// Output: If successful returns [MovieDetails] details of the movie.
  /// may throw exception.
  Future<MovieDetails> getMovieDetails(GetMovieDetailsParams params);

  /// This method will gets the list of all genres
  /// Output: If successful returns [Genres] list of the genre.
  /// may throw exception.
  Future<Genres> getGenres();

  /// This method will search the movies against the provided query
  /// Input: [params] contains query.
  /// Output: If successful returns [MoviesList] List of upcoming [Movie] and other meta data.
  /// may throw exception.
  Future<MoviesList> searchMovie(SearchMoviesParams params);
}
