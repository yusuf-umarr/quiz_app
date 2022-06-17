import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:quiz_app/src/core/constants/config.dart';
import 'package:quiz_app/src/services/api_status_code.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/authentication/model/login_request_model.dart';
import '../features/authentication/model/login_response_model.dart';
import '../features/authentication/model/register_request_model.dart';
import '../features/authentication/model/register_response_model.dart';
import 'api_status.dart';

class ApiService {
  static var client = http.Client();

  static Future<Object> login(LoginRequestModel model) async {
           print("seen!!!!!!!!! !!");

    try {
      Map<String, String> requestHeaders = {
        "Content-Type": "application/json",
      };

      var url = Uri.http(Config.apiURL, Config.loginAPI);

      var response = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(model.toJson()),
      );
//convert to map and decode
      if (response.statusCode == 200) {
             print("response okay!!!!!!!!! !!");
        Map<String, dynamic> output = json.decode(response.body);
        // sharefre

        var encodedUser = output['user'];
//encode user and save to sharefreprefrence
        var newUser = jsonEncode(encodedUser);

        SharedPreferences sharePreference =
            await SharedPreferences.getInstance();
        sharePreference.setString('token', output['token']);

        sharePreference.setString('user', newUser);

        return Success(response: loginResponseModelFromJson(response.body));
        // return Success(response: loginResponseModelFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'Please check your connection');
    } on SocketException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'Please check your connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
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


/*
 if (userViewModel.userError != null) {
      return AppError(
        errorText:userViewModel.userError?.message.toString(),
      );
    }
*/