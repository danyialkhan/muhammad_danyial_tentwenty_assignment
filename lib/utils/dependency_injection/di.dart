import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/datasources/remote_datasource/dio_error_handler.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/datasources/remote_datasource/dio_wrapper.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/datasources/remote_datasource/remote_data_source.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/datasources/remote_datasource/remote_datasource_impl.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/repository/repositiry_impl.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/repository/repository.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/generes/bloc/genre_bloc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/generes/usecases/get_generes.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/home/bloc/bloc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/bloc/movie_detail_bloc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_details.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_images.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_videos.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/bloc/upcomming_movies_bloc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/usecases/get_upcoming_movies_list.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/search_movies/usecases/search_movie.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/globals.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/network/network_info.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/network/network_info_imp.dart';

Future<void> init() async {
  registerExternalTrovesDependencies();
  registerCoreDependencies();
  registerRepository();
  registerDataSources();
  registerBlocs();
  registerUseCases();
}

void registerCoreDependencies() {
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(connectionChecker: sl()));
}

void registerExternalTrovesDependencies() {
  sl.registerLazySingleton<Dio>(() => Dio(BaseOptions(receiveTimeout: 60000, connectTimeout: 60000, sendTimeout: 60000, baseUrl: url)));
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
  sl.registerLazySingleton<Logger>(() => Logger(filter: ShowAllLogsFilter()));
  sl.registerLazySingleton<DioErrorHandler>(() => DioErrorHandlerImpl());
  sl.registerLazySingleton<DioWrapper>(() => DioWrapperImpl(
        dio: sl(),
        logger: sl(),
        dioErrorHandler: sl(),
      ));
}

void registerRepository() {
  sl.registerLazySingleton<Repository>(() => RepositoryImpl(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));
}

void registerDataSources() {
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(dioWrapper: sl(), logger: sl()));
}

void registerBlocs() {
  sl.registerLazySingleton<HomeTabBloc>(() => HomeTabBloc());
  sl.registerLazySingleton<UpComingMoviesBloc>(() => UpComingMoviesBloc(getUpComingMoviesList: sl()));
  sl.registerLazySingleton<GenreBloc>(() => GenreBloc(getMovieGenre: sl(), searchMovies: sl()));
  sl.registerLazySingleton<MovieDetailsBloc>(() => MovieDetailsBloc(
        getMovieDetails: sl(),
        getMovieImages: sl(),
        getMovieVideos: sl(),
      ));
}

void registerUseCases() {
  sl.registerLazySingleton<GetUpComingMoviesList>(() => GetUpComingMoviesList(sl()));
  sl.registerLazySingleton<GetMovieDetails>(() => GetMovieDetails(sl()));
  sl.registerLazySingleton<GetMovieGenre>(() => GetMovieGenre(sl()));
  sl.registerLazySingleton<SearchMovies>(() => SearchMovies(sl()));
  sl.registerLazySingleton<GetMovieImages>(() => GetMovieImages(sl()));
  sl.registerLazySingleton<GetMovieVideos>(() => GetMovieVideos(sl()));
}

class ShowAllLogsFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
