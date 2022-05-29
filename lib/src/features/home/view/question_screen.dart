import 'package:flutter/material.dart';
import 'package:quiz_app/src/widgets/buttonWidget.dart';
import 'package:quiz_app/src/widgets/startIcon.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_string.dart';
import '../../../core/utilities/size-config.dart';
import '../../../widgets/check_button_container_widget.dart';
import '../../../widgets/divider_break_line.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? qtn = 06;
    return Scaffold(
        backgroundColor: AppColor.bgColor,
        body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.horizontal_padding,
                vertical: AppSizes.vertical_padding),
            child: ListView(
              children: [
                questionText(
                    AppString.mathematics + " " + AppString.quiz,
                    AppSizes.xlarge_dimension,
                    FontWeight.w400,
                    AppColor.textColor),
                SizedBox(height: AppSizes.big_dimension),
                Row(children: [
                  questionText(AppString.question, AppSizes.xlarge_dimension,
                      FontWeight.w700, AppColor.whiteColor),
                  SizedBox(width: AppSizes.small_dimension),
                  questionText(qtn.toString(), AppSizes.xxlarge_dimension,
                      FontWeight.w700, AppColor.whiteColor),
                  SizedBox(width: AppSizes.small_dimension),
                  questionText("/20", AppSizes.xxlarge_dimension,
                      FontWeight.w400, AppColor.textColor),
                ]),
                dividerLines(20),
                Container(
                  height: SizeConfig.safeBlockVertical! * 16,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [questionsBox()]),
                ),

                SizedBox(height: AppSizes.large_dimension),
                optionsWidget(),
                optionsWidget(),
                optionsWidget(),
                optionsWidget(),
                // Spacer(),
                SizedBox(height: AppSizes.xxxxlarge_dimension),

                Row(
                  children: [
                    ButtonWidget(
                      textColor: AppColor.whiteColor,
                      iconWidget: Row(children: [
                        Icon(Icons.power_settings_new,
                            color: AppColor.whiteColor),
                        SizedBox(width: AppSizes.small_dimension),
                      ]),
                      text: '${AppString.quit} ${AppString.quiz}',
                      bgColor: AppColor.blackColor,
                      ontap: () {},
                    ),
                    Spacer(),
                    ButtonWidget(
                        textColor: AppColor.whiteColor,
                        bgColor: AppColor.iconColor,
                        text: 'Next',
                        ontap: () {}),
                  ],
                )
              ],
            )));
  }

  questionText(text, fontSize, fontWeight, color) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'inter',
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color),
    );
  }

  dividerLines(num) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          num,
          (index) => Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSizes.tiny_dimension),
              child: Divider(
                color: AppColor.whiteColor,
                thickness: AppSizes.xtiny_dimension,
              ),
            ),
          ),
        ));
  }

  questionsBox() {
    return Column(
      children: [
        questionText(
            'The graphs of the two linear equations ax + by =c  and bx -ay = c, where a,b and c are all not equal to zero.',
            AppSizes.medium_text,
            FontWeight.w500,
            AppColor.whiteColor),
      ],
    );
  }

  optionsWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.horizontal_padding),
      child: InkWell(
        onTap: () {},
        child: Container(
            // margin: EdgeInsets.symmetric(vertical: AppSizes.horizontal_padding),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.greenColor),
                borderRadius: BorderRadius.circular(AppSizes.big_dimension)),
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.horizontal_padding,
              vertical: AppSizes.vertical_padding,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  questionText('Are parallel', AppSizes.medium_text,
                      FontWeight.w500, AppColor.whiteColor),
                  CheckButtonContainerWidget(
                    color: AppColor.greenColor,
                    borderColor: AppColor.greenColor,
                  )
                ])),
      ),
    );
  }
}
