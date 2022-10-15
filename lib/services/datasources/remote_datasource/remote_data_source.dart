import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/usecases/get_upcoming_movies_list.dart';

abstract class RemoteDataSource {
  /// This method will gets the list of all upcoming moves
  /// Input: [params] contains api key, page no, language.
  /// Output: If successful returns [UpComingMovies] List of upcoming [Movie] and other meta data.
  /// may throw exception.
  Future<UpComingMovies> getUpComingMovies(GetUpComingMoviesListParams params);
}
