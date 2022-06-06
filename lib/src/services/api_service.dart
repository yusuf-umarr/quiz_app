import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:quiz_app/src/core/constants/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/authentication/model/login_request_model.dart';
import '../features/authentication/model/login_response_model.dart';
import '../features/authentication/model/register_request_model.dart';
import '../features/authentication/model/register_response_model.dart';
import 'api_status.dart';

class ApiService {
  static var client = http.Client();

  static Future<dynamic> login(LoginRequestModel model) async {
  try{
      Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
    };

    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> output = json.decode(response.body);

      // sharefre
      SharedPreferences sharePreference = await SharedPreferences.getInstance();
      sharePreference.setString('token', output['token']);

      // print(output['token']);
      // print(output );

      return Success(response: loginResponseJson(response.body));
      // return true;
    } return Failure(code: Config.USER_INVALID_RESPONSE, errorResponse: "Invalid Response");

    
  
  
  }
  on HttpException {
      return Failure(code: Config.NO_INTERNET, errorResponse: 'No Internet connection');

    }
       on SocketException {
      return Failure(code: Config.NO_INTERNET, errorResponse: 'No Internet connection');
    } 
    on FormatException {
      return Failure(code: Config.INVALID_FORMAT, errorResponse: 'Invalid Format');
    }
  
  catch (e) {
     return Failure(code:Config.UNKNOWN_ERROR, errorResponse: 'Unknown Error');
  }
    // else {
    //   return false;
    // }
  }

  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
    };

    var url = Uri.http(Config.apiURL, Config.registerAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseModel(response.body);
  }
}
