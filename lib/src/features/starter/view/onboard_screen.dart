import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/src/core/constants/app_sizes.dart';
import 'package:quiz_app/src/features/authentication/view/sign_in.dart';
import 'package:quiz_app/src/features/authentication/view/sign_up.dart';
import 'package:quiz_app/src/features/starter/onboard_view_model.dart';
import 'package:quiz_app/src/widgets/large_buttons.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_string.dart';
import '../../../core/utilities/navigation_utils.dart';
import '../../../core/utilities/size-config.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnboadViewModel onboadViewModel = context.watch<OnboadViewModel>();
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Column(
        children: [
          onboardContainer(onboadViewModel),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSizes.horizontal_padding),
            child: Column(children: [
              AppLargeButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  text: AppString.sign_up,
                  backgroundColor: AppColor.iconColor),
              SizedBox(
                height: AppSizes.large_dimension,
              ),
              AppLargeButton(
                  onTap: () {
                    Navigator.of(context).push(SignInRoute());
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => SignInScreen()));
                  },
                  text: AppString.sign_in,
                  backgroundColor: AppColor.bgColor),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 12,
              ),
            ]),
          )
        ],
      ),
    );
  }

  onboardContainer(onboadViewModel) {
    return Flexible(
        fit: FlexFit.tight,
        child: PageView.builder(
            controller: onboadViewModel.pageController,
            onPageChanged: onboadViewModel.openNextIndex,
            itemCount: onboadViewModel.onboardList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(height: SizeConfig.safeBlockVertical! * 2),
                      Positioned(
                          child: Align(
                        child: onBoardImage(
                          index,
                          onboadViewModel,
                        ),
                      )),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 1,
                          child: Center(
                            child: Column(
                              children: [
                                onBoardTitle(index, onboadViewModel),
                                SizedBox(
                                    height:
                                        SizeConfig.safeBlockVertical! * 1),
                                onBoardDesc(index, onboadViewModel),
                                SizedBox(
                                    height:
                                        SizeConfig.safeBlockVertical! * 1),
                                onboardIndicator(onboadViewModel),
                                SizedBox(
                                    height:
                                        SizeConfig.safeBlockVertical! * 1),
                              ],
                            ),
                          )),
                    ],
                  ),
                ],
              );
            }));
  }

  //uses to diplay the onbord image
  onBoardImage(index, onboadViewModel) {
    return Center(
      child: Image.asset(
        onboadViewModel.onboardList[index].image,
        fit: BoxFit.fill,
        height: SizeConfig.safeBlockVertical! * 60,
        width: SizeConfig.safeBlockHorizontal! * 100,
      ),
    );
  }

  onBoardTitle(index, onboadViewModel) {
    return Text(onboadViewModel.onboardList[index].title,
        style: TextStyle(
            fontFamily: 'inter',
            fontSize: AppSizes.large_dimension,
            fontWeight: FontWeight.w700,
            color: AppColor.iconColor));
  }

  onBoardDesc(index, onboadViewModel) {
    return Text(onboadViewModel.onboardList[index].description,
        style: TextStyle(
            fontFamily: 'inter',
            fontSize: AppSizes.medium_text,
            fontWeight: FontWeight.w500,
            color: AppColor.textColor));
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

  onboardIndicator(onboadViewModel) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            onboadViewModel.onboardList.length,
            (index) => Container(
                  margin: EdgeInsets.all(AppSizes.small_dimension),
                  width: AppSizes.big_dimension,
                  height: onboadViewModel.selectedPageIndex == index ? 5 : 5,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppSizes.small_dimension),
                    shape: BoxShape.rectangle,
                    color: onboadViewModel.selectedPageIndex == index
                        ? AppColor.iconColor
                        : AppColor.textColor,
                  ),
                )));
  }
}
