import 'package:dio/dio.dart';
import '../../../../util/common_widgets.dart';
import '../../../../util/constant.dart';
import '../../../../util/preferences.dart';

import '../service/api_exception.dart';
import '../service/api_service.dart';
import '../service/app_url.dart';

class LoginSignupApi {
  final ApiService _apiService = ApiService();

  Future<Response> login(
      {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await _apiService.post(
        AppUrl.login,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } on DioError catch (e) {
      Toasty.showtoast(ApiException.fromDioError(e).message.toString());
      Response errorResponse = Response(
        requestOptions: RequestOptions(),
        statusCode: 0,
      );
      return errorResponse;
    }
  }



  Future<Response> signUp(
      {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final Response response = await _apiService.post(
        AppUrl.signUp,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } on DioError catch (e) {
      Toasty.showtoast(ApiException.fromDioError(e).message.toString());
      Response errorResponse = Response(
        requestOptions: RequestOptions(),
        statusCode: 0,
      );
      return errorResponse;
    }
  }




}
