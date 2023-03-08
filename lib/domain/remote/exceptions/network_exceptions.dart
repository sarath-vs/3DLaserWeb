// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'network_exceptions.freezed.dart';

@freezed
class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.Exception(
      [@Default('Unknown error occured. Contact customer service')
          String message]) = Exception;
  const factory NetworkExceptions.notFound(
      [@Default('Invalid User name / password') String message]) = NotFound;
  const factory NetworkExceptions.timeOut(
      [@Default('Time out') String message]) = TimeOut;
  const factory NetworkExceptions.error([@Default('Time out') String message]) =
      Error;
  const factory NetworkExceptions.internalServerError(
      [@Default('Internal server error') String message]) = InternalServerError;
  const factory NetworkExceptions.unKnownError(
      [@Default('Unknown error occured') String message]) = UnKnownError;
  const factory NetworkExceptions.noInternet(
      [@Default('Network unavailable') String message]) = NoInternet;
}

NetworkExceptions getExceptionFromStatusCode(int code) {
  final exceptionsMap = {
    404: const NetworkExceptions.timeOut(),
    400: const NetworkExceptions.notFound(),
    403: const NetworkExceptions.error(),
    504: const NetworkExceptions.timeOut(),
    500: const NetworkExceptions.internalServerError(),
  };
  if (exceptionsMap.containsKey(code)) {
    return exceptionsMap[code]!;
  } else {
    return const NetworkExceptions.unKnownError();
  }
}

String getMessageFromException(NetworkExceptions exception) {
  return exception.map(
    Exception: (v) => v.message,
    timeOut: (v) => v.message,
    notFound: (v) => v.message,
    internalServerError: (v) => v.message,
    unKnownError: (v) => v.message,
    noInternet: (v) => v.message,
    error: (value) => value.message,
  );
}
