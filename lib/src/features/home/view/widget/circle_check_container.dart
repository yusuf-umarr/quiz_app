import 'package:flutter/material.dart';
import 'package:quiz_app/src/core/constants/app_color.dart';
import 'package:quiz_app/src/core/utilities/size-config.dart';

class CircleCheckContainer extends StatelessWidget {
  const CircleCheckContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColor.bgColor,
            border: Border.all(color: AppColor.textColor),
            shape: BoxShape.circle),
        child: Icon(
          Icons.circle_outlined,
          color: AppColor.bgColor,
          size: SizeConfig.safeBlockHorizontal! * 5.5,
        ));
  }
}