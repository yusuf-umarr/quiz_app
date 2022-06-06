

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/authentication/view_model/user_view_model.dart';
import '../../features/home/view/result_screen.dart';
import '../../features/home/view_model/home_view_model.dart';
import '../../widgets/buttonWidget.dart';
import '../constants/app_color.dart';
import '../constants/app_string.dart';
import 'size-config.dart';

extension HelperExtension on BuildContext {


  showDialogBox(context, text) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.safeBlockHorizontal! * 5))),
            content: Container(
              height: SizeConfig.safeBlockVertical! * 25,
              width: SizeConfig.safeBlockHorizontal! * 100,
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal! * 3.8),
              decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(
                      SizeConfig.safeBlockHorizontal! * 10)),
              child: Column(
                children: [
                  //you are to delete this post

                  Expanded(
                    child: questionText(
                      text,
                      
                      SizeConfig.heightMultiplier! * 2,
                      FontWeight.w500,
                      AppColor.iconColor,
                    ),
                  ),

                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 2.6,
                  ),

                  ButtonWidget(
                      textColor: AppColor.whiteColor,
                      bgColor: AppColor.iconColor,
                      text: AppString.yes,
                      ontap: () {

                          if (homeViewModel.selectedOption) {
                          homeViewModel.score++;
                          homeViewModel.selectedOption = false;
                         homeViewModel.resetPageController(); 
                          print('selected score' + homeViewModel.score.toString());

                        }
                        
                        removeUntil(context);

                      }),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 2.6,
                  ),

                  ButtonWidget(
                      textColor: AppColor.whiteColor,
                      bgColor: AppColor.textColor,
                      text: AppString.no,
                      ontap: () {
                        Navigator.of(context, rootNavigator: true).pop(context);
                      }),
                ],
              ),
            ),
          );
        });
  }




  void removeUntil(context){
    Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ResultScreen()),
                (Route<dynamic> route) => false);
  }
   questionText(text, fontSize, fontWeight, color) {
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