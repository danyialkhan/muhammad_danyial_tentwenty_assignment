import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);
}

Failure handleFailure(Either<Failure, dynamic> resultEither) {
  return resultEither.fold((failure) => failure, (r) => null)!;
}

class DioInternalError extends Failure {
  const DioInternalError({required String message}) : super(message);

  @override
  List<Object?> get props => [message];
}

class DioNotFoundError extends Failure {
  const DioNotFoundError({required String message}) : super(message);

  @override
  List<Object?> get props => [message];
}

class DioContentNotFound extends Failure {
  const DioContentNotFound({required String message}) : super(message);

  @override
  List<Object?> get props => [message];
}

class DioBadRequest extends Failure {
  const DioBadRequest({required String message}) : super(message);

  @override
  List<Object?> get props => [message];
}

class DioUnAuthorized extends Failure {
  const DioUnAuthorized({required String message}) : super(message);

  @override
  List<Object?> get props => [message];
}

class DioDefaultFailure extends Failure {
  const DioDefaultFailure({required String message}) : super(message);

  @override
  List<Object?> get props => [message];
}