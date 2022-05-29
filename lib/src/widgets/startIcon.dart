import 'package:flutter/material.dart';
import 'package:quiz_app/src/core/constants/app_color.dart';



import '../core/utilities/size-config.dart';

class StartIcon extends StatelessWidget {
  final Color? starColor;
  const StartIcon({Key? key, this.starColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.star,
        color: starColor != null ? starColor : AppColor.textColor,
        size: SizeConfig.safeBlockHorizontal! * 4);
  }
}
