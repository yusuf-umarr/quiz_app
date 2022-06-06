import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:flutter/material.dart';

import '../features/authentication/model/login_response_model.dart';
import '../features/authentication/view/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist("Login_details");
    return isKeyExist;
  }

  static Future<LoginResponseModel?> loginDetails() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist("Login_details");

    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData("login_detals");

      return loginResponseJson(cacheData.syncData);
    }
  }

//   static Future<void>setLoginDetails(LoginResponseModel model) async {

//     APICacheDBModel cacheDBModel = APICacheDBModel(
//       key: "login_details",
//       syncData: jsonEncode(model.toJson()),
//     );

// await APICacheManager().addCacheData(cacheDBModel);
//   }
  static Future<void>setLoginDetails(LoginResponseModel model) async {
    // SharedPreferences loginPreference = await SharedPreferences.getInstance();
    // loginPreference.setString('token', value)


    // APICacheDBModel cacheDBModel = APICacheDBModel(
    //   key: "login_details",
    //   syncData: jsonEncode(model.toJson()),
    // );

// await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> logout(BuildContext context) async {
    // await APICacheManager().deleteCache('login_detals');
       SharedPreferences sharePreference = await SharedPreferences.getInstance();
      sharePreference.remove('token');

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => SignUpScreen()),
        (Route<dynamic> route) => false);
    // Navigator.pushNamedAndRemoveUntil(context, SignUpScreen(), ((route) => false))
  }
}
