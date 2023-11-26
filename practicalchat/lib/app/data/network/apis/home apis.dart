import 'package:dio/dio.dart';
import '../../../../util/common_widgets.dart';
import '../../../../util/constant.dart';
import '../../../../util/preferences.dart';

import '../service/api_exception.dart';
import '../service/api_service.dart';
import '../service/app_url.dart';

class HomeApi {
  final ApiService _apiService = ApiService();

  var useToken;

  HomeApi()  {
    useToken = box.read(PrefsKey.userToken);
    print(useToken);
    print("fdskjhfskjdhsdkj");
  }

  Future<Response> allusers(
      { Map<String, dynamic>? headers}) async {
    try {
      final Response response = await _apiService.get(
        AppUrl.allusers,

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
