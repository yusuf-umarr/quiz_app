import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const CupertinoActivityIndicator(),
    ));
  }
}


/*

  static Future<Object> getCountry() async {
    //  print('ok1');
    try {
      Map<String, String> requestHeaders = {
        "Accept": "application/json",
        "Authorization": country_token,
      };

      http.Response response =
          await http.get(Uri.parse(country_url), headers: requestHeaders);

      if (SUCCESS == response.statusCode) {
        return Success(response: countryModelFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'Please check your connection');
    } on SocketException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'Please check your connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }

*/



/*

 getUsers() async {
    setLoading(true);
    var response = await UserService.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse,
      );

      setUserError(userError);
    }

    setLoading(false);
  }


*/