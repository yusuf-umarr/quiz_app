import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/src/core/constants/app_image.dart';
import 'package:quiz_app/src/core/utilities/size-config.dart';
import 'package:quiz_app/src/features/authentication/view/sign_in.dart';
import 'package:quiz_app/src/features/authentication/view_model/user_view_model.dart';
import 'package:quiz_app/src/widgets/large_buttons.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_string.dart';
import '../../../widgets/custom_input.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        UserViewModel userViewModel = context.watch<UserViewModel>();

    return Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: AppBar(
          title: const Text(AppString.sign_up),
          centerTitle: true,
          backgroundColor: AppColor.bgColor,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.large_text),
          child: ListView(
            children: [
              Column(children: [
                SizedBox(height: AppSizes.medium_dimension),
                Row(children: [
                  homeText(AppString.introduce_yourself, AppSizes.big_text,
                      FontWeight.w700, AppColor.whiteColor),
                ]),
                SizedBox(height: AppSizes.small_dimension),
                Row(children: [
                  homeText(AppString.choose_your_bio_desc, AppSizes.small_text,
                      FontWeight.w400, AppColor.textColor),
                ]),
                SizedBox(height: AppSizes.xxxxlarge_dimension),
                CustomInput(
                    alignText: TextAlign.start,
                    label: AppString.username_hint,
                    hint: '',
                    onChanged: (val) async {}),
                SizedBox(height: AppSizes.xxxlarge_dimension),
                CustomInput(
                    alignText: TextAlign.start,
                    label: AppString.email_hint,
                    hint: '',
                    onChanged: (val) async {}),
                SizedBox(height: AppSizes.xxxlarge_dimension),
                CustomInput(
                    alignText: TextAlign.start,
                    label: AppString.password_hint,
                    isSecure: true,
                    hint: '',
                    onChanged: (val) async {}),
                SizedBox(height: AppSizes.xxxlarge_dimension),
                userViewModel.profileImage != null
            ? profileImageContainer(userViewModel)
            : camaraIcon(userViewModel),
                SizedBox(height: AppSizes.xxxlarge_dimension),
                AppLargeButton(
                    text: AppString.register,
                    backgroundColor: AppColor.iconColor),
                SizedBox(height: AppSizes.xxxxlarge_dimension),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  // Spacer(),
                  homeText(AppString.existing_user, AppSizes.small_text,
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
  camaraIcon(userViewModel) {
    return InkWell(
      onTap: () => userViewModel.pickImage(),
      child: CircleAvatar(
        backgroundColor: AppColor.whiteColor.withOpacity(0.1),
        radius: SizeConfig.safeBlockHorizontal! * 13,
        child: Container(
          child: Image.asset(
            AppImage.profileImg
            // AppIcons.camera_icon,
            // fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

   profileImageContainer(userViewModel) {
    return InkWell(
      onTap: () => userViewModel.pickImage(),
      child: CircleAvatar(
        radius: SizeConfig.safeBlockHorizontal! * 13,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: FileImage(
                userViewModel.profileImage!,
              ),
            ),
          ),
        ),
      ),
    );
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
