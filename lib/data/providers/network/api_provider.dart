import 'dart:async';
import 'dart:io';

import 'package:get/get_connect/connect.dart';

enum HTTPMethod { get, post, delete, put, patch }

extension HTTPMethodString on HTTPMethod {
  String get string {
    switch (this) {
      case HTTPMethod.get:
        return "get";
      case HTTPMethod.post:
        return "post";
      case HTTPMethod.delete:
        return "delete";
      case HTTPMethod.patch:
        return "patch";
      case HTTPMethod.put:
        return "put";
    }
  }
}

class APIProvider {
  static final _singleton = APIProvider._();

  factory APIProvider() => _singleton;

  APIProvider._();

  static const requestTimeOut = Duration(seconds: 25);
  final _client = GetConnect(timeout: requestTimeOut);

  FutureOr request({
    required String domain,
    required String path,
    required HTTPMethod method,
    Map<String, String>? headers,
    Map<String, String>? query,
    dynamic body,
  }) async {
    try {
      final response = await _client.request(
        '$domain${path.startsWith('/') ? '' : '/'}$path',
        method.string,
        headers: headers,
        query: query,
        body: body,
      );

      switch (response.statusCode) {
        case 200:
          return response.body;
        case 400:
          throw AuthenticationException(response.body.toString());
        case 401:
        case 403:
          throw UnauthorisedException(response.statusCode!, response.body.toString());
        case 404:
          throw BadRequestException('Not found');
        case 500:
          throw InternalServerErrorException('Internal Server Error');
        default:
          throw CommunicationException(response.statusCode, 'Error occurred while Communication with Server');
      }
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw InternalServerErrorException('No Internet connection');
    }
  }
}

class AppException implements Exception {
  const AppException({required this.statusCode, required this.message, this.details});

  final int statusCode;
  final String message;
  final String? details;

  @override
  String toString() => "[$statusCode]: $message${details?.isNotEmpty == true ? '\n$details' : ''}";
}

class CommunicationException extends AppException {
  const CommunicationException(int? statusCode, String? details)
    : super(statusCode: statusCode ?? 599, message: "Error During Communication", details: details);
}

class InternalServerErrorException extends AppException {
  const InternalServerErrorException(String? details)
    : super(statusCode: 500, message: "Internal Server Error", details: details);
}

class BadRequestException extends AppException {
  const BadRequestException(String? details) : super(statusCode: 400, message: "Invalid Request", details: details);
}

class UnauthorisedException extends AppException {
  const UnauthorisedException(int statusCode, String? details)
    : super(statusCode: statusCode, message: "Unauthorised", details: details);
}

class AuthenticationException extends AppException {
  const AuthenticationException(String? details)
    : super(statusCode: 400, message: "Authentication Failed", details: details);
}

class TimeOutException extends AppException {
  const TimeOutException(String? details) : super(statusCode: 408, message: "Request TimeOut", details: details);
}
