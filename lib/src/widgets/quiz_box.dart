import 'package:flutter/material.dart';

import '../core/constants/app_color.dart';
import '../core/constants/app_sizes.dart';
import '../core/utilities/size-config.dart';

class QuizBox extends StatelessWidget {
  final String? text;
  final String? img;
  final Color? color;
  final Function()? ontap;
  const QuizBox({Key? key, this.text, required this.img, this.ontap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: AppSizes.large_dimension,
            horizontal: AppSizes.horizontal_padding),
        // width
        decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(AppSizes.big_dimension)),
        height: SizeConfig.safeBlockVertical! * 17,
        width: SizeConfig.safeBlockHorizontal! * 27,
        child: Column(
          children: [
            productImage(img),
            Spacer(),
            Text(text!, style: TextStyle(fontSize: AppSizes.tiny_text, color: color ?? AppColor.blackColor)),
          ],
        ));
  }

  Widget productImage(image) {
    return Container(
      height: SizeConfig.safeBlockVertical! * 6,
      width: SizeConfig.safeBlockHorizontal! * 10,
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.fitHeight, image: AssetImage(image))),
    );
  }
}
