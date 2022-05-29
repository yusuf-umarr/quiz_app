/*the following classes define the large button widget use in application, 

@author yusuf umar
@since 29-11-2021
*/
import 'package:flutter/material.dart';
import 'package:quiz_app/src/core/constants/app_color.dart';
import 'package:quiz_app/src/core/utilities/size-config.dart';

import '../core/constants/app_sizes.dart';

class AppLargeButton extends StatelessWidget {
  //uses to store the background color
  final Color? backgroundColor;
//uses to store the text color color
  final Color? textColor;
  //uses to store the border color
  final Color? borderColor;
  //uses to store the ontap function
  final Function()? onTap;
  //uses to store the border state
  final bool? isBorder;
  //uses to store the text
  final String text;
  //uses to store the text font size
  final double? textSize;

  const AppLargeButton(
      {Key? key,
      this.backgroundColor,
      this.textColor,
      this.borderColor,
      this.textSize,
      this.onTap,
      this.isBorder: false,
      required this.text})
      : super(key: key);

  @override
  //uses a InkWell to rendered the Large button widget
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: SizeConfig.safeBlockVertical! * 6.66,
          width: SizeConfig.safeBlockHorizontal! * 90,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius:
              
                  BorderRadius.circular(AppSizes.large_dimension),
              border: Border.all(
                  width: 1, color: borderColor ?? AppColor.iconColor)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: textSize ?? SizeConfig.safeBlockHorizontal! * 4.5,
                  color: textColor ?? AppColor.whiteColor),
            ),
          )),
    );
  }
}
