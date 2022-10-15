import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/datasources/remote_datasource/remote_data_source.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/datasources/remote_datasource/remote_datasource_impl.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/repository/repositiry_impl.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/repository/repository.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/generes/usecases/get_generes.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/home/bloc/bloc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_details.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/usecases/get_upcoming_movies_list.dart';
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
}

void registerUseCases() {
  sl.registerLazySingleton<GetUpComingMoviesList>(() => GetUpComingMoviesList(sl()));
  sl.registerLazySingleton<GetMovieDetails>(() => GetMovieDetails(sl()));
  sl.registerLazySingleton<GetMovieGenre>(() => GetMovieGenre(sl()));
}

class ShowAllLogsFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
