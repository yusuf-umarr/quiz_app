import 'package:flutter/material.dart';
import 'package:quiz_app/src/core/constants/app_color.dart';
import 'package:quiz_app/src/core/constants/app_image.dart';
import 'package:quiz_app/src/core/constants/app_string.dart';
import 'package:quiz_app/src/core/utilities/size-config.dart';
import 'package:quiz_app/src/widgets/buttonWidget.dart';
import '../../../core/constants/app_sizes.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int total = 20;
    return Scaffold(
        backgroundColor: AppColor.bgColor,
        body: Container(
            padding: EdgeInsets.symmetric(
                vertical: AppSizes.vertical_padding,
                horizontal: AppSizes.horizontal_padding),
            height: SizeConfig.safeBlockVertical! * 120,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(AppImage.bg_img))),
            child: ListView(
              children: [
                Column(children: [
                  resultText(
                      "${AppString.quiz} ${AppString.result}",
                      AppSizes.xxlarge_dimension,
                      FontWeight.w700,
                      AppColor.whiteColor),
                ]),
                SizedBox(height: AppSizes.big_dimension),
                Container(
                  height: SizeConfig.safeBlockVertical! * 30,
                  child: Stack(children: [
                    Positioned(
                        child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        AppImage.congrat_cup,
                        width: SizeConfig.safeBlockHorizontal! * 70,
                      ),
                    )),
                    Positioned(
                        // top: 50,
                        child: Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: AppSizes.xlarge_dimension,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(AppImage.profileImg)),
                          ),
                        ),
                      ),
                    )),
                  ]),
                ),
                Column(children: [
                  resultText(
                      AppString.congratulations,
                      AppSizes.xxlarge_dimension,
                      FontWeight.w700,
                      AppColor.whiteColor),
                  resultText(AppString.you_have_unlock, AppSizes.big_dimension,
                      FontWeight.w400, AppColor.whiteColor),
                  SizedBox(height: AppSizes.large_dimension),
                  resultText(AppString.your_score, AppSizes.big_dimension,
                      FontWeight.w400, AppColor.textColor),
                  SizedBox(height: AppSizes.small_dimension),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  resultText('18', AppSizes.xxxlarge_dimension, FontWeight.w700,
                      AppColor.greenColor),
                  resultText(' / ${total}', AppSizes.xxxlarge_dimension,
                      FontWeight.w700, AppColor.whiteColor),
                ]),
                SizedBox(height: SizeConfig.safeBlockVertical! * 10),
                Row(
                  children: [
                    ButtonWidget(
                      bgColor: AppColor.whiteColor,
                      textColor: AppColor.bgColor,
                      iconWidget: Row(children: [
                        Icon(Icons.share, color: AppColor.bgColor),
                        SizedBox(width: AppSizes.small_dimension),
                      ]),
                      text: AppString.share_result,
                      ontap: () {},
                    ),
                    Spacer(),
                    ButtonWidget(
                        bgColor: AppColor.iconColor,
                        textColor: AppColor.whiteColor,
                        text: 'Take New Quiz',
                        ontap: () {}),
                  ],
                ),
                SizedBox(height: AppSizes.xxxxlarge_dimension),
                Column(children: [
                  Icon(Icons.home_outlined,
                      color: AppColor.iconColor,
                      size: AppSizes.xxxlarge_dimension)
                ])
              ],
            )));
  }

  resultText(text, fontSize, fontWeight, color) {
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
