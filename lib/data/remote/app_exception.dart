import 'package:arch_app_flutter/constant/app_strings.dart';

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class ResultDataErrorException extends AppException {
  ResultDataErrorException([String? message])
      : super(message,"");
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, AppStrings.errorDuringCommunication);
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, AppStrings.invalidRequest);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, AppStrings.unauthorisedRequest);
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, AppStrings.invalidInput);
}

class InvalidClientException extends AppException {
  InvalidClientException([String? message]) : super(message, AppStrings.invalidClient);
}