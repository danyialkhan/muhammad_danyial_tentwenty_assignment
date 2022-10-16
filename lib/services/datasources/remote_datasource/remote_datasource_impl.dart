import 'package:easy_localization/easy_localization.dart';
import 'package:logger/logger.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/api_paths/api_paths.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/datasources/remote_datasource/dio_wrapper.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/datasources/remote_datasource/remote_data_source.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/generes/usecases/get_generes.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_details.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_images.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_videos.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/usecases/get_upcoming_movies_list.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/search_movies/usecases/search_movie.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/constants/string%20constants.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/globals.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  final DioWrapper _dio;
  final Logger _logger;

  RemoteDataSourceImpl({
    required DioWrapper dioWrapper,
    required Logger logger,
  })  : _dio = dioWrapper,
        _logger = logger;

  @override
  Future<MoviesList> getUpComingMovies(GetUpComingMoviesListParams params) async {
    final queryParams = {
      'api_key': apiKey,
      'language': params.language,
      'page': params.page,
    };

    final response = await _dio.onGet(api: APIPaths.onGetUpComingMovies, queryParameters: queryParams);

    _logger.i("[RemoteDataSourceImpl | getUpComingMovies] :: $response");

    if (response.data != null) {
      return MoviesList.fromJson(response.data);
    }

    throw AppStrings.SOMETHING_WENT_WRONG.tr();
  }

  @override
  Future<MovieDetails> getMovieDetails(GetMovieDetailsParams params) async {
    final queryParams = {
      'api_key': apiKey,
    };

    final response = await _dio.onGet(api: '${APIPaths.onGetMovieDetails}/${params.movieId}', queryParameters: queryParams);

    _logger.i("[RemoteDataSourceImpl | getMovieDetails] :: $response");

    if (response.data != null) {
      return MovieDetails.fromJson(response.data);
    }

    throw AppStrings.SOMETHING_WENT_WRONG.tr();
  }

  @override
  Future<Genres> getGenres() async {
    final queryParams = {
      'api_key': apiKey,
    };

    final response = await _dio.onGet(api: APIPaths.onGetGenre, queryParameters: queryParams);

    _logger.i("[RemoteDataSourceImpl | getGenres] :: $response");

    if (response.data != null) {
      return Genres.fromJson(response.data);
    }

    throw AppStrings.SOMETHING_WENT_WRONG.tr();
  }

  @override
  Future<MoviesList> searchMovie(SearchMoviesParams params) async {
    final queryParams = {
      'api_key': apiKey,
      'query': params.query,
      'page': params.page,
    };

    final response = await _dio.onGet(api: APIPaths.onSearchMovie, queryParameters: queryParams);

    _logger.i("[RemoteDataSourceImpl | searchMovie] :: $response");

    if (response.data != null) {
      return MoviesList.fromJson(response.data);
    }

    throw AppStrings.SOMETHING_WENT_WRONG.tr();
  }

  @override
  Future<MovieImages> getMovieImages(int params) async {
    final queryParams = {
      'api_key': apiKey,
    };

    final response = await _dio.onGet(api: '${APIPaths.onGetMovieDetails}$params/images', queryParameters: queryParams);

    _logger.i("[RemoteDataSourceImpl | getMovieImages] :: $response");

    if (response.data != null) {
      return MovieImages.fromJson(response.data);
    }

    throw AppStrings.SOMETHING_WENT_WRONG.tr();
  }

  @override
  Future<MovieVideos> getMovieVideos(int params) async {
    final queryParams = {
      'api_key': apiKey,
    };

    final response = await _dio.onGet(api: '${APIPaths.onGetMovieDetails}$params/videos', queryParameters: queryParams);

    _logger.i("[RemoteDataSourceImpl | getMovieVideos] :: $response");

    if (response.data != null) {
      return MovieVideos.fromJson(response.data);
    }

    throw AppStrings.SOMETHING_WENT_WRONG.tr();
  }
}
