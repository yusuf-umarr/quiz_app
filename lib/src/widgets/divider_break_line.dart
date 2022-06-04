import 'package:flutter/material.dart';
import 'package:quiz_app/src/core/constants/app_color.dart';
import 'package:quiz_app/src/core/constants/app_sizes.dart';

class DividerBreakLine extends StatelessWidget {
  const DividerBreakLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [dividerLines(20)],
    );
  }

  dividerLines(num) {
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          num,
          (index) =>
              //  Expanded(
              //   child:
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSizes.small_dimension),
                child: Divider(
                  color: AppColor.whiteColor,
                  thickness: AppSizes.xtiny_dimension,
                ),
              )),
      // )
    );
  }
}
