import 'package:flutter/material.dart';
import 'package:quiz_app/src/core/constants/app_color.dart';
import 'package:quiz_app/src/core/constants/app_image.dart';
import 'package:quiz_app/src/core/constants/app_string.dart';
import 'package:quiz_app/src/core/utilities/size-config.dart';
import 'package:quiz_app/src/features/authentication/view/sign_up.dart';
import 'package:quiz_app/src/widgets/custom_input.dart';
import 'package:quiz_app/src/widgets/large_buttons.dart';

import '../../../core/constants/app_sizes.dart';
import '../../bottom_nav/bottom_nav.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.bgColor,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.large_text),
          child: ListView(
            children: [
              Column(children: [
                SizedBox(height: AppSizes.xxlarge_dimension),
                Image.asset(AppImage.thinking_img,
                    height: SizeConfig.safeBlockVertical! * 15,
                    width: SizeConfig.safeBlockVertical! * 9),
                SizedBox(height: AppSizes.medium_dimension),
                homeText(AppString.welcome, AppSizes.big_text, FontWeight.w700,
                    AppColor.whiteColor),
                SizedBox(height: AppSizes.xxxxlarge_dimension),
                CustomInput(
                    alignText: TextAlign.start,
                    label: AppString.email_hint,
                    hint: '',
                    onChanged: (val) async {}),
                SizedBox(height: AppSizes.xxxlarge_dimension),
                CustomInput(
                    alignText: TextAlign.start,
                    label: AppString.password_hint,
                    hint: '',
                    onChanged: (val) async {}),
                SizedBox(height: AppSizes.xlarge_dimension),
                Row(
                  children: [
                    Spacer(),
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
                AppLargeButton(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BottomNav()));
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
                      //SignUpScreen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: homeText(AppString.register, AppSizes.small_text,
                        FontWeight.w500, AppColor.iconColor),
                  )
                ])
              ])
            ],
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
}
