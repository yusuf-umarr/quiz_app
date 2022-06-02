import 'package:flutter/material.dart';
import 'package:quiz_app/src/core/constants/app_sizes.dart';
import 'package:quiz_app/src/features/home/view/question_screen.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_image.dart';
import '../../../core/constants/app_string.dart';
import '../../../core/utilities/size-config.dart';
import '../../../widgets/quiz_box.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.homeBgColor,
        body: ListView(
          children: [
            Container(
              height: SizeConfig.safeBlockVertical! * 40,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.horizontal_padding,
                        vertical: AppSizes.vertical_padding),
                    height: SizeConfig.safeBlockHorizontal! *
                        AppSizes.xxxxlarge_dimension,
                    decoration: BoxDecoration(
                      color: AppColor.skyBlackColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(AppSizes.big_dimension),
                        bottomLeft: Radius.circular(AppSizes.big_dimension),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            profileImgContainer(),
                            SizedBox(width: AppSizes.medium_dimension),
                            homeText("John", AppSizes.big_text, FontWeight.w700,
                                AppColor.whiteColor),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    // bottom: 0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.horizontal_padding),
                          height: SizeConfig.safeBlockHorizontal! *
                              AppSizes.xxxxlarge_dimension,
                          width: SizeConfig.safeBlockHorizontal! * 90,
                          decoration: BoxDecoration(
                            color: AppColor.blackColor,
                            borderRadius:
                                BorderRadius.circular(AppSizes.big_dimension),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: SizeConfig.safeBlockVertical! * 17,
                                width: SizeConfig.safeBlockHorizontal! * 30,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fitHeight,
                                        image:
                                            AssetImage(AppImage.thinking_img))),
                              ),
                              SizedBox(width: AppSizes.large_dimension),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    homeText('Test', AppSizes.big_text,
                                        FontWeight.w700, AppColor.whiteColor),
                                    SizedBox(height: AppSizes.medium_dimension),
                                    homeText('Your', AppSizes.big_text,
                                        FontWeight.w700, AppColor.whiteColor),
                                    SizedBox(height: AppSizes.medium_dimension),
                                    homeText('Knowledge', AppSizes.big_text,
                                        FontWeight.w700, AppColor.whiteColor),
                                  ])
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: AppSizes.big_dimension,
            ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                homeText(AppString.top_quiz_cate, AppSizes.large_text,
                    FontWeight.w700, AppColor.blackColor),
                viewAllCOntainer()
              ],
            )),
            SizedBox(
              height: AppSizes.big_dimension,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSizes.horizontal_padding),
              child: Wrap(
                  spacing: AppSizes.big_dimension,
                  runSpacing: AppSizes.large_dimension,
                  children: [
                    QuizBox(
                        img: AppImage.math_logo,
                        text: AppString.mathematics,
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const QuestionScreen()));
                        }),
                    QuizBox(
                        img: AppImage.math_logo, text: AppString.mathematics),
                    QuizBox(
                        img: AppImage.math_logo, text: AppString.mathematics),
                    QuizBox(
                        img: AppImage.math_logo, text: AppString.mathematics),
                  ]),
            )
          ],
        ));
  }

  profileImgContainer() {
    return CircleAvatar(
      radius: AppSizes.xxlarge_dimension,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(AppImage.profileImg)),
        ),
      ),
    );
  }

  viewAllCOntainer() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.big_dimension,
          vertical: AppSizes.medium_dimension),
      decoration: BoxDecoration(
          color: AppColor.skyIconColor,
          borderRadius: BorderRadius.circular(AppSizes.small_dimension)),
      child: homeText(AppString.view_all, AppSizes.tiny_text, FontWeight.w500,
          AppColor.iconColor),
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
