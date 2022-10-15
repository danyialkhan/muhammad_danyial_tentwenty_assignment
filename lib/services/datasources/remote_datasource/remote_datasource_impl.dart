import 'package:easy_localization/easy_localization.dart';
import 'package:logger/logger.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/api_paths/api_paths.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/datasources/remote_datasource/dio_wrapper.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/datasources/remote_datasource/remote_data_source.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_details.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/usecases/get_upcoming_movies_list.dart';
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
  Future<UpComingMovies> getUpComingMovies(GetUpComingMoviesListParams params) async {
    final queryParams = {
      'api_key': apiKey,
      'language': params.language,
      'page': params.page,
    };

    final response = await _dio.onGet(api: APIPaths.onGetUpComingMovies, queryParameters: queryParams);

    _logger.i("[RemoteDataSourceImpl | getUpComingMovies] :: $response");

    if (response.data != null) {
      return UpComingMovies.fromJson(response.data);
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
}
