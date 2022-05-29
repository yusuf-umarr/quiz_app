import 'package:flutter/material.dart';
import 'package:quiz_app/src/features/authentication/view/sign_in.dart';
import 'package:quiz_app/src/widgets/large_buttons.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_string.dart';
import '../../../widgets/custom_input.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: AppBar(
          title: const Text(AppString.reset_password),
          centerTitle: true,
          backgroundColor: AppColor.bgColor,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.large_text),
          child: ListView(
            children: [
              Column(children: [
                // SizedBox(height: AppSizes.medium_dimension),
                // Row(children: [
                //   homeText(AppString.introduce_yourself, AppSizes.big_text,
                //       FontWeight.w700, AppColor.whiteColor),
                // ]),
                SizedBox(height: AppSizes.small_dimension),
                Row(children: [
                  homeText(AppString.enter_email_reset_pass,
                      AppSizes.small_text, FontWeight.w400, AppColor.textColor),
                ]),
                SizedBox(height: AppSizes.xxxxlarge_dimension),
                CustomInput(
                    alignText: TextAlign.start,
                    label: AppString.username_hint,
                    hint: '',
                    onChanged: (val) async {}),
                SizedBox(height: AppSizes.xxxlarge_dimension),
                // CustomInput(
                //     alignText: TextAlign.start,
                //     label: AppString.email_hint,
                //     hint: '',
                //     onChanged: (val) async {}),
                // SizedBox(height: AppSizes.xxxlarge_dimension),
                // CustomInput(
                //     alignText: TextAlign.start,
                //     label: AppString.password_hint,
                //     isSecure: true,
                //     hint: '',
                //     onChanged: (val) async {}),
                // SizedBox(height: AppSizes.xxxlarge_dimension),
                AppLargeButton(
                    text: AppString.next, backgroundColor: AppColor.iconColor),
                SizedBox(height: AppSizes.xxxxlarge_dimension),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  // Spacer(),
                  homeText(AppString.go_back_sign_in, AppSizes.small_text,
                      FontWeight.w500, AppColor.whiteColor),
                  SizedBox(width: AppSizes.small_dimension),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    },
                    child: homeText(AppString.sign_in, AppSizes.small_text,
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
