import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/src/core/constants/app_color.dart';
import 'package:quiz_app/src/core/constants/app_image.dart';
import 'package:quiz_app/src/core/constants/app_string.dart';
import 'package:quiz_app/src/core/utilities/size-config.dart';
import 'package:quiz_app/src/features/home/view/solution_screen.dart';
import 'package:quiz_app/src/features/home/view_model/home_view_model.dart';
import 'package:quiz_app/src/widgets/buttonWidget.dart';
import '../../../../main.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../widgets/question_list.dart';
import '../../bottom_nav/view/bottom_nav.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key}) : super(key: key);
  var questions = getIt.get<QuestionList>().questions;

  @override
  Widget build(BuildContext context) {
        HomeViewModel homeViewModel = context.watch<HomeViewModel>();

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
                      text: AppString.view_solution,
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SolutionScreen(
                                      qtn: questions,
                                    )));
                        //SolutionScreen(qtn: questions,)
                      },
                    ),
                    Spacer(),
                    ButtonWidget(
                        bgColor: AppColor.iconColor,
                        textColor: AppColor.whiteColor,
                        text: AppString.take_new_quiz,
                        ontap: () {}),
                  ],
                ),
                SizedBox(height: AppSizes.xxxxlarge_dimension),
                Column(children: [
                  InkWell(
                    onTap: () {
                      homeViewModel.score = 0;

                      removeUntil(context, BottomNav());
                    },
                    child: Icon(Icons.home_outlined,
                        color: AppColor.iconColor,
                        size: AppSizes.xxxlarge_dimension),
                  )
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

  void removeUntil(context, screen) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => screen),
        (Route<dynamic> route) => false);
  }
}
