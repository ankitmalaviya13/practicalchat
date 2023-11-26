import 'package:dio/dio.dart';

class ApiException implements Exception {
  ApiException.fromDioError(DioError dioError) {
    print(dioError.type);
    print("fashdfkjahfkhak");
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioErrorType.unknown:
        print(dioError.error);
        print(dioError.response);

        print(dioError.response.runtimeType);
        print(dioError.message);
        print(dioError.type);
        print("Fadlkfjlkdsfjlk");
        if (dioError.response.toString() == "null") {
          print("flkfhdkjfdf");
          message = "Unexpected error occurred";
          break;
        }
        if (dioError.message!.contains("SocketException")) {
          message = 'No Internet';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  late String message;

  @override
  String toString() => message;

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error['error'];
      case 422:
        return error["errors"][0]["msg"];
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }
}
