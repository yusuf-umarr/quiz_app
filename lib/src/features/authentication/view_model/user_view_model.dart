import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_app/src/features/authentication/model/login_request_model.dart';
import 'package:quiz_app/src/services/api_status.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/utilities/navigation_utils.dart';
import '../../../services/api_service.dart';
import '../model/login_response_model.dart';

class UserViewModel extends ChangeNotifier {
  var selectedPageIndex = 0;
  var pageController = PageController();
  bool isSecure = true;
  io.File? profileImage;

  List<LoginResponseModel> _loginResponseUserModel = [];

  LoginRequestModel? _loginRequestModel;

  List<LoginResponseModel> get loginResponseUserModel =>
      _loginResponseUserModel;
  LoginRequestModel? get loginRequestModel => _loginRequestModel;

  UserError? _userError;
  UserError? get userError => _userError;

  bool isLoading = false;

  setUserError(UserError userError) {
    _userError = userError;
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = io.File(image.path);
      profileImage = imageTemporary;
    } on PlatformException catch (e) {
      debugPrint('$e');
    }
    notifyListeners();
  }

  passwordVisibility() {
    return IconButton(
      icon: Icon(isSecure ? Icons.visibility_off : Icons.visibility,
          color: AppColor.iconColor),
      onPressed: () {
        isSecure = !isSecure;
        notifyListeners();
      },
    );
  }

  setLoginResponseModel(List<LoginResponseModel> loginResponseUserModel) async {
    _loginResponseUserModel = loginResponseUserModel;
  }

  setLoading(bool loading) async {
    isLoading = loading;
    notifyListeners();
  }

  setLogingResponse(model, context) async {
    var response = await ApiService.login(model);
    print("okay!!!!!!!!! !!");

    if (response is Success) {
      setLoading(false);
      //  print("okay!!!!!!!!! !!");
      // print(response.response);

      //  openBottomNav( context);

      // setLoginResponseModel(response.response as List<LoginResponseModel>);

      Navigator.of(context).push(BottomNavRoute());
      // setLoginResponseModel(response.response as List<Map<String, Object<LoginResponseModel>>>);

    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse,
      );

      setUserError(userError);
    }
  }
}
