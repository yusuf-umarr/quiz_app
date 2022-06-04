import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/src/core/utilities/helper.dart';
import 'package:quiz_app/src/features/home/view/result_screen.dart';
import 'package:quiz_app/src/features/home/view/widget/divider_line.dart';
import 'package:quiz_app/src/features/home/view_model/home_view_model.dart';
import 'package:quiz_app/src/widgets/buttonWidget.dart';
import 'package:quiz_app/src/widgets/question_list.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_string.dart';
import '../../../widgets/check_button_container_widget.dart';
import 'widget/circle_check_container.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({Key? key}) : super(key: key);

  int questionIndex = 1;

  var questions = getIt.get<QuestionList>().questions;

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
                        "/${questions.length}",
                        AppSizes.xxlarge_dimension,
                        FontWeight.w400,
                        AppColor.textColor),
                  ]),
                  const DividerLine(num: 20),
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
                        ontap: () {
                          context.showDialogBox(
                            context,
                            AppString.are_you_you_want_to_end,
                          );
                        },
                      ),
                      const Spacer(),
                      ButtonWidget(
                          textColor: AppColor.whiteColor,
                          bgColor: AppColor.iconColor,
                          text: homeViewModel.isLastPage
                              ? AppString.submit
                              : AppString.next,
                          ontap: () {
                            if (homeViewModel.isLastPage) {
                              context.showDialogBox(
                                context,
                                AppString.are_you_you_want_to_submit,
                              );

                           
                            } else {
                              if (homeViewModel.selectedOption) {
                                homeViewModel.score++;
                                print('selected score' + homeViewModel.score.toString());
                              } else {
                                print('selected score' +homeViewModel.score.toString());
                              }
                              homeViewModel.nextPage();
                              homeViewModel.selectedOption = false;
                            }
                          }),
                    ],
                  )
                ],
              )),
        ));
  }


  void removeUntil(context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => ResultScreen()),
        (Route<dynamic> route) => false);
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

  questionsBox(question) {
    return questionText(question, AppSizes.medium_text, FontWeight.w500,
        AppColor.whiteColor);
  }

  questionContainer(homeViewModel) {
    return Flexible(
        fit: FlexFit.tight,
        child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: homeViewModel.pageController,
            onPageChanged: homeViewModel.openNextIndex,

            itemCount: questions.length,
            itemBuilder: (context, index) {
              questionIndex = index + 1;
              return Column(
                children: [
                  Column(children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //question
                          questionsBox(questions[index]['qtn'])
                        ]),
                    SizedBox(height: AppSizes.large_dimension),
                    //option
                    ...(questions[index]['option']
                            as List<Map<String, Object>>)
                        .map((ans) => optionsWidget(
                            ans['opt'], ans['isTrue'], homeViewModel))
                  ]),
                ],
              );
            }));
  }

  optionsWidget(option, isTrue, homeViewModel) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.horizontal_padding),
      child: InkWell(
        onTap: () {
          homeViewModel.setSelectedAns(option);

          homeViewModel.selectedOption = isTrue;
        },
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: homeViewModel.selectedAns == option
                        ? AppColor.greenColor
                        : AppColor.textColor),
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
                  homeViewModel.selectedAns == option
                      ? CheckButtonContainerWidget(
                          color: AppColor.greenColor,
                          borderColor: AppColor.greenColor)
                      : const CircleCheckContainer()
                ])),
      ),
    );
  }


}



