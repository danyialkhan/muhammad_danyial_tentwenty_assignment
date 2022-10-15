import 'package:dio/dio.dart' as dio;
import 'package:easy_localization/easy_localization.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/errors/failures.dart';

abstract class DioErrorHandler {
  Failure resolveErrors({required dio.Response<dynamic> response});
  Failure throwDefaultFailure();
}

class FingeRateErrorHandlerImpl extends DioErrorHandler {
  @override
  Failure resolveErrors({required dio.Response<dynamic> response}) {
    switch (response.statusCode) {
      case 500:
        return DioInternalError(message: 'internal_error'.tr());
      case 404:
        return DioNotFoundError(message: 'not_found'.tr());
      case 204:
        return DioContentNotFound(message: 'content_not_found'.tr());
      case 401:
        return DioUnAuthorized(message: 'un_authorized_request'.tr());
      default:
        return DioDefaultFailure(message: 'something_went_wrong'.tr());
    }
  }
  @override
  Failure throwDefaultFailure() {
    return DioDefaultFailure(message: 'something_went_wrong'.tr());
  }
}
