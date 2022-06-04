import 'package:flutter/material.dart';
import '../core/utilities/size-config.dart';

class CheckButtonContainerWidget extends StatelessWidget {
  final Color color;
  final Color borderColor;
  const CheckButtonContainerWidget({Key? key, required this.borderColor,required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 1),
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: borderColor),
           
            shape: BoxShape.circle),
        child: Icon(Icons.check,
            size: SizeConfig.safeBlockHorizontal! * 3.5, color: Colors.white));
  }
}
