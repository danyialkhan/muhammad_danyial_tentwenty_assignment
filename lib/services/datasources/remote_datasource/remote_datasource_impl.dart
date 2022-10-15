import 'package:logger/logger.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/datasources/remote_datasource/dio_wrapper.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/datasources/remote_datasource/remote_data_source.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  final DioWrapper _dioWrapper;
  final Logger _logger;

  RemoteDataSourceImpl({
    required DioWrapper dioWrapper,
    required Logger logger,
  })  : _dioWrapper = dioWrapper,
        _logger = logger;
}
