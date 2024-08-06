
import 'package:http/http.dart';
import 'package:mvvm/data/network/BaseApiUrl.dart';
import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/resources/components/App_url.dart';

class AuthRepositry {

  BaseApiServices _apiServices = Networkapiservice();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndpoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }


  Future<dynamic> SignUpApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerEndPointUrl,data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}