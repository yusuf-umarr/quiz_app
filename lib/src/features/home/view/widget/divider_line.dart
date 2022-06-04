import 'package:flutter/material.dart';
import 'package:quiz_app/src/core/constants/app_color.dart';

import '../../../../core/constants/app_sizes.dart';

class DividerLine extends StatelessWidget {
  final int num;
  const DividerLine({Key? key, required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          num,
          (index) => Expanded(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSizes.tiny_dimension),
              child: Divider(
                color: AppColor.whiteColor,
                thickness: AppSizes.xtiny_dimension,
              ),
            ),
          ),
        ));
  }
}