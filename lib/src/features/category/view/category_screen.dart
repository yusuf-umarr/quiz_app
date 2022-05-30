import 'package:flutter/material.dart';
import 'package:quiz_app/src/core/constants/app_sizes.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_image.dart';
import '../../../core/constants/app_string.dart';
import '../../../widgets/quiz_box.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColor.bgColor,
          title: const Text(AppString.quiz_categories),
        ),
        backgroundColor: AppColor.bgColor,
        body: Container(
            padding:
                EdgeInsets.symmetric(horizontal: AppSizes.horizontal_padding),
            child: ListView(children: [
              // Column(children: [
              //   categoryText(AppString.quiz_categories, AppSizes.large_text,
              //       FontWeight.w700, AppColor.whiteColor),
              // ]),
              SizedBox(
                height: AppSizes.big_dimension,
              ),
              Wrap(
                  spacing: AppSizes.big_dimension,
                  runSpacing: AppSizes.large_dimension,
                  children: [
                    QuizBox(
                        img: AppImage.math_logo,
                        text: AppString.mathematics,
                        color: AppColor.iconColor),
                    QuizBox(
                        img: AppImage.math_logo,
                        text: AppString.mathematics,
                        color: AppColor.iconColor),
                    QuizBox(
                        img: AppImage.math_logo,
                        text: AppString.mathematics,
                        color: AppColor.iconColor),
                    QuizBox(
                        img: AppImage.math_logo,
                        text: AppString.mathematics,
                        color: AppColor.iconColor),
                    QuizBox(
                        img: AppImage.math_logo,
                        text: AppString.mathematics,
                        color: AppColor.iconColor),
                    QuizBox(
                        img: AppImage.math_logo,
                        text: AppString.mathematics,
                        color: AppColor.iconColor),
                    QuizBox(
                        img: AppImage.math_logo,
                        text: AppString.mathematics,
                        color: AppColor.iconColor),
                    QuizBox(
                        img: AppImage.math_logo,
                        text: AppString.mathematics,
                        color: AppColor.iconColor),
                    QuizBox(
                        img: AppImage.math_logo,
                        text: AppString.mathematics,
                        color: AppColor.iconColor),
                    QuizBox(
                        img: AppImage.math_logo,
                        text: AppString.mathematics,
                        color: AppColor.iconColor),
                    QuizBox(
                        img: AppImage.math_logo,
                        text: AppString.mathematics,
                        color: AppColor.iconColor),
                    QuizBox(
                        img: AppImage.math_logo,
                        text: AppString.mathematics,
                        color: AppColor.iconColor),
                    QuizBox(
                        img: AppImage.math_logo,
                        text: AppString.mathematics,
                        color: AppColor.iconColor),
                  ]),
            ])));
  }

  categoryText(text, fontSize, fontWeight, color) {
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
