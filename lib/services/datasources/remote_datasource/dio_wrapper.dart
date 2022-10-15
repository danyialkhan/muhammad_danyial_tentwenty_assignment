import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:logger/logger.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/datasources/remote_datasource/dio_error_handler.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/datasources/remote_datasource/dio_interceptor_wrapper.dart';

abstract class DioWrapper {
  Future<Response<dynamic>> onPost({required String api, required dynamic data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, String? jwt});
  Future<Response<dynamic>> onPostImageData({required String api, required String data, String? jwt});

  Future<Response<dynamic>> onPatch({required String api, required dynamic data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, String? jwt});

  Future<Response<dynamic>> onGet({required String api, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, String? jwt});

  void resolveAPIMetadata({Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, String? jwt});
}

class DioWrapperImpl extends DioWrapper {
  final Dio _dio;
  final Logger _logger;
  final DioErrorHandler _fingerateErrorHandler;

  DioWrapperImpl({
    required Dio dio,
    required Logger logger,
    required DioErrorHandler fingeRateErrorHandler,
  })  : _dio = dio,
        _logger = logger,
        _fingerateErrorHandler = fingeRateErrorHandler;

  @override
  Future<Response<dynamic>> onPost({
    required String api,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? jwt,
  }) async {
    try {
      resolveAPIMetadata(queryParameters: queryParameters, headers: headers, jwt: jwt);
      return await _dio.post(api, data: data);
    } on DioError catch (e) {
      _logger.wtf('[ON POST | DIO ERROR] ${e.response}');
      if (e.type == DioErrorType.response) {
        throw _fingerateErrorHandler.resolveErrors(response: e.response!);
      }
      throw _fingerateErrorHandler.throwDefaultFailure();
    } catch (e) {
      _logger.wtf('[ON POST | SOMETHING GOES WRONG IN API CALL] $e');
      throw _fingerateErrorHandler.throwDefaultFailure();
    }
  }

  @override
  Future<Response> onPostImageData({required String api, required String data, String? jwt}) async {
    try {
      final extensionType = data.split('/').last.split('.').last;
      resolveAPIMetadata(jwt: jwt);
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          data,
          filename: data.split('/').last,
          contentType: MediaType("image", extensionType),
        ),
      });
      return await _dio.post(api, data: formData);
    } on DioError catch (e) {
      _logger.wtf('[ON POST | DIO ERROR] ${e.response}');
      if (e.type == DioErrorType.response) {
        throw _fingerateErrorHandler.resolveErrors(response: e.response!);
      }
      throw _fingerateErrorHandler.throwDefaultFailure();
    } catch (e) {
      _logger.wtf('[ON POST | SOMETHING GOES WRONG IN API CALL] $e');
      throw _fingerateErrorHandler.throwDefaultFailure();
    }
  }

  @override
  Future<Response<dynamic>> onPatch({
    required String api,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? jwt,
  }) async {
    try {
      resolveAPIMetadata(queryParameters: queryParameters, headers: headers, jwt: jwt);
      return await _dio.patch(api, data: data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        _logger.wtf('[ON PATCH | DIO ERROR] ${e.response}');
        throw _fingerateErrorHandler.resolveErrors(response: e.response!);
      }
      throw _fingerateErrorHandler.throwDefaultFailure();
    } catch (e) {
      _logger.wtf('[ON PATCH | SOMETHING GOES WRONG IN API CALL] $e');
      throw _fingerateErrorHandler.throwDefaultFailure();
    }
  }

  @override
  Future<Response<dynamic>> onGet({
    required String api,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? jwt,
  }) async {
    try {
      resolveAPIMetadata(queryParameters: queryParameters, headers: headers, jwt: jwt);
      return await _dio.get(api);
    } on DioError catch (e) {
      _logger.wtf('[ON GET | DIO ERROR] $e');
      if (e.type == DioErrorType.response) {
        throw _fingerateErrorHandler.resolveErrors(response: e.response!);
      }
      throw _fingerateErrorHandler.throwDefaultFailure();
    } catch (e) {
      _logger.wtf('[ON GET | SOMETHING GOES WRONG IN API CALL] $e');
      throw _fingerateErrorHandler.throwDefaultFailure();
    }
  }

  @override
  void resolveAPIMetadata({Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, String? jwt}) {
    _dio.options.queryParameters.clear();
    if (queryParameters != null) {
      _dio.options.queryParameters.addAll(queryParameters);
    }
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }
    if (jwt != null) {
      _dio.interceptors.addAll([FingerateCustomInterceptors(jwt: jwt, dio: _dio, logger: _logger)]);
    }
  }
}
