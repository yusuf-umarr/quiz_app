import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/src/core/constants/app_color.dart';
import 'package:quiz_app/src/core/constants/app_image.dart';
import 'package:quiz_app/src/core/constants/app_string.dart';
import 'package:quiz_app/src/core/utilities/size-config.dart';
import 'package:quiz_app/src/features/authentication/model/login_request_model.dart';
import 'package:quiz_app/src/features/authentication/view/sign_up.dart';
import 'package:quiz_app/src/features/authentication/view_model/user_view_model.dart';
import 'package:quiz_app/src/widgets/custom_input.dart';
import 'package:quiz_app/src/widgets/large_buttons.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../services/api_service.dart';
import '../../bottom_nav/view/bottom_nav.dart';
import '../../home/view/widget/app_loading.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  // Timer? timer;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();

    return Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: AppBar(
          title: const Text(AppString.sign_in),
          centerTitle: true,
          backgroundColor: AppColor.bgColor,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: SizeConfig.safeBlockVertical! * 100,
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.large_text,
                  vertical: AppSizes.large_text),
              child: Column(children: [
                SizedBox(height: AppSizes.xxxxlarge_dimension),
                Icon(Icons.login_outlined,
                    size: SizeConfig.safeBlockVertical! * 20,
                    color: AppColor.whiteColor),
                SizedBox(height: AppSizes.xxxxlarge_dimension),
                Column(children: [
                  CustomInput(
                      alignText: TextAlign.start,
                      label: AppString.email_hint,
                      hint: '',
                      controller: emailController,
                      onChanged: (val) async {}),
                  SizedBox(height: AppSizes.xxxlarge_dimension),
                  CustomInput(
                    alignText: TextAlign.start,
                    label: AppString.password_hint,
                    hint: '',
                    controller: passwordController,
                    onChanged: (val) async {},
                    isSecure: userViewModel.isSecure,
                    suffixIcon: userViewModel.passwordVisibility(),
                  ),
                ]),
                SizedBox(height: AppSizes.xlarge_dimension),
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: homeText(
                          AppString.forgot_password,
                          AppSizes.small_text,
                          FontWeight.w500,
                          AppColor.whiteColor),
                    )
                  ],
                ),
                SizedBox(height: AppSizes.xlarge_dimension),
                userViewModel.isLoading? const AppLoading():
                AppLargeButton(
                    onTap: () {
                       userViewModel.setLoading( true) ;
                      LoginRequestModel model = LoginRequestModel(
                          email: emailController.text,
                          password: passwordController.text);
                      ApiService.login(model).then((response) => {
                            if (response)
                           
                              {
                                //  print(response),
                                //  print( _data['token']),
                                   userViewModel.setLoading( false),
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            BottomNav()),
                                    (Route<dynamic> route) => false)
                              } else{
                                print("Invalid email/password")
                              }
                          });
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => BottomNav()));
                    },
                    text: AppString.sign_in,
                    backgroundColor: AppColor.iconColor),

                SizedBox(height: AppSizes.xxxxlarge_dimension),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  // Spacer(),
                  homeText(AppString.dont_have_account, AppSizes.small_text,
                      FontWeight.w500, AppColor.whiteColor),
                  SizedBox(width: AppSizes.small_dimension),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: homeText(AppString.register, AppSizes.small_text,
                        FontWeight.w500, AppColor.iconColor),
                  )
                ])
              ]),
            ),
          ),
        ));
  }

  homeText(text, fontSize, fontWeight, color) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'inter',
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color),
    );
  }

  onboardContainer(userViewModel) {
    return Flexible(
        fit: FlexFit.tight,
        child: PageView.builder(
            controller: userViewModel.pageController,
            // onPageChanged: selectedPageIndex,
            onPageChanged: userViewModel.openNextIndex,
            itemCount: userViewModel.onboardList.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    onBoardImage(index, userViewModel),
                    SizedBox(height: SizeConfig.safeBlockVertical! * 2),
                    onBoardDesc(index, userViewModel),
                    SizedBox(height: SizeConfig.safeBlockVertical! * 1),
                  ],
                ),
              );
            }));
  }

  //uses to diplay the onbord image
  onBoardImage(index, userViewModel) {
    return Center(
      child: Image.asset(
        userViewModel.onboardList[index].image,
        fit: BoxFit.fill,
        height: SizeConfig.safeBlockHorizontal! * 55,
        width: SizeConfig.safeBlockHorizontal! * 70,
      ),
    );
  }

  //uses to display the onboard description
  onBoardDesc(index, userViewModel) {
    return Text(userViewModel.onboardList[index].description,
        style: TextStyle(
            fontFamily: 'inter',
            fontSize: AppSizes.medium_text,
            fontWeight: FontWeight.w500,
            color: AppColor.textColor));
  }
}


/*

 static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(USER_LIST);
      var response = await http.get(url);
      if (SUCCESS == response.statusCode) {
        return Success(response: userListModelFromJson(response.body));
      }
      //failure object when status code is not 200
      return Failure(code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    }
     on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet connection');
    } 
     on SocketException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet connection');
    } 
    
    on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }

 */ 
