import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/src/features/home/view_model/home_view_model.dart';
import 'package:quiz_app/src/widgets/buttonWidget.dart';
import 'package:quiz_app/src/widgets/startIcon.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_string.dart';
import '../../../core/utilities/size-config.dart';
import '../../../widgets/check_button_container_widget.dart';
import '../../../widgets/divider_break_line.dart';
import '../model/question_model.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({Key? key}) : super(key: key);

  int questionIndex = 1;

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();

    // int? qtn = 06;
    return Scaffold(
        backgroundColor: AppColor.bgColor,
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.horizontal_padding,
                  vertical: AppSizes.vertical_padding),
              child: Column(
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
                    questionText(
                        questionIndex.toString(),
                        AppSizes.xxlarge_dimension,
                        FontWeight.w700,
                        AppColor.whiteColor),
                    SizedBox(width: AppSizes.small_dimension),
                    questionText(
                        "/${homeViewModel.questions.length}",
                        AppSizes.xxlarge_dimension,
                        FontWeight.w400,
                        AppColor.textColor),
                  ]),
                  dividerLines(20),
                  //QUESTION
                  questionContainer(homeViewModel),

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
              )),
        ));
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

  questionsBox(question) {
    return Column(
      children: [
        questionText(question, AppSizes.medium_text, FontWeight.w500,
            AppColor.whiteColor),
      ],
    );
  }

  optionsWidget(option) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.horizontal_padding),
      child: InkWell(
        onTap: () {
          // print('selected option ${option}');
        },
        child: Container(
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
                  questionText(option, AppSizes.medium_text, FontWeight.w500,
                      AppColor.whiteColor),
                  CheckButtonContainerWidget(
                    color: AppColor.greenColor,
                    borderColor: AppColor.greenColor,
                  )
                ])),
      ),
    );
  }

  questionContainer(homeViewModel) {
    return Flexible(
        fit: FlexFit.tight,
        child: PageView.builder(
            controller: homeViewModel.pageController,
            onPageChanged: homeViewModel.openNextIndex,
            itemCount: homeViewModel.questions.length,
            itemBuilder: (context, index) {
              questionIndex = index + 1;
              return Container(
                child: Column(
                  children: [
                    Column(children: [
                      Container(
                        height: SizeConfig.safeBlockVertical! * 16,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //question
                              questionsBox(
                                  homeViewModel.questions[index]['qtn'])
                            ]),
                      ),
                      SizedBox(height: AppSizes.large_dimension),
                      //option
                      ...(homeViewModel.questions[index]['option']
                              as List<Map<String, Object>>)
                          .map((ans) => optionsWidget(ans['opt']))
                    ]),
                  ],
                ),
              );
            }));
  }
}
