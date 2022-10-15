import 'package:muhammad_danyial_tentwenty_assignment/services/datasources/remote_datasource/remote_data_source.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/repository/repository.dart';

class RepositoryImpl extends Repository {

  final RemoteDataSource _remoteDataSource;

  RepositoryImpl({required RemoteDataSource remoteDataSource}) : _remoteDataSource = remoteDataSource;

}