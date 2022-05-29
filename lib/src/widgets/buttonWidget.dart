import 'package:flutter/material.dart';
import 'package:quiz_app/src/core/constants/app_color.dart';
import 'package:quiz_app/src/core/constants/app_sizes.dart';
import 'package:quiz_app/src/core/utilities/size-config.dart';

class ButtonWidget extends StatelessWidget {
  final Color? bgColor;
  final Color? textColor;
  final String? text;
  final Function()? ontap;
  final Widget? iconWidget;
  const ButtonWidget(
      {Key? key,
      this.bgColor,
      this.text,
      this.ontap,
      this.iconWidget,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          width: SizeConfig.safeBlockHorizontal! * 43,
          height: AppSizes.xxxxlarge_dimension,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.big_dimension),
              color: bgColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: iconWidget),
              textWidget(text, AppSizes.large_text, FontWeight.w500, textColor),
            ],
          )),
    );
  }

  textWidget(text, fontSize, fontWeight, color) {
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
