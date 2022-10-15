import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/localization/locale_keys.g.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/datasources/remote_datasource/remote_data_source.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/errors/failures.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/repository/repository.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/usecases/get_upcoming_movies_list.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/network/network_info.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl({
    required RemoteDataSource remoteDataSource,
    required NetworkInfo networkInfo,
  })  : _remoteDataSource = remoteDataSource,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, UpComingMovies>> getUpComingMovies(GetUpComingMoviesListParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(NetworkFailure(message: LocaleKeys.no_internet.tr()));
    }
    try {
      return Right(await _remoteDataSource.getUpComingMovies(params));
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (_) {
      return Left(ServerFailure(LocaleKeys.something_went_wrong.tr()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
