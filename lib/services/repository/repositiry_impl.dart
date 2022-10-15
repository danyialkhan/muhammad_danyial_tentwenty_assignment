import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:muhammad_danyial_tentwenty_assignment/app/localization/locale_keys.g.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/datasources/remote_datasource/remote_data_source.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/errors/failures.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/repository/repository.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/generes/usecases/get_generes.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_details.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_details_screen/use_cases/get_movie_images.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/usecases/get_upcoming_movies_list.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/search_movies/usecases/search_movie.dart';
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
  Future<Either<Failure, MoviesList>> getUpComingMovies(GetUpComingMoviesListParams params) async {
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

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(GetMovieDetailsParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(NetworkFailure(message: LocaleKeys.no_internet.tr()));
    }
    try {
      return Right(await _remoteDataSource.getMovieDetails(params));
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (_) {
      return Left(ServerFailure(LocaleKeys.something_went_wrong.tr()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Genres>> getGenres() async {
    if (!await _networkInfo.isConnected) {
      return Left(NetworkFailure(message: LocaleKeys.no_internet.tr()));
    }
    try {
      return Right(await _remoteDataSource.getGenres());
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (_) {
      return Left(ServerFailure(LocaleKeys.something_went_wrong.tr()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MoviesList>> searchMovie(SearchMoviesParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(NetworkFailure(message: LocaleKeys.no_internet.tr()));
    }
    try {
      return Right(await _remoteDataSource.searchMovie(params));
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (_) {
      return Left(ServerFailure(LocaleKeys.something_went_wrong.tr()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieImages>> getMovieImages(int params) async {
    if (!await _networkInfo.isConnected) {
      return Left(NetworkFailure(message: LocaleKeys.no_internet.tr()));
    }
    try {
      return Right(await _remoteDataSource.getMovieImages(params));
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (_) {
      return Left(ServerFailure(LocaleKeys.something_went_wrong.tr()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
