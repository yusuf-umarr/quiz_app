import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/src/features/home/view_model/home_view_model.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_string.dart';
import '../../../widgets/question_list.dart';

class SolutionScreen extends StatelessWidget {
  var qtn;
  SolutionScreen({Key? key,required this.qtn}) : super(key: key);

  // var questions = getIt.get<QuestionList>().questions;

  int count = 0;
  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();

    return Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: AppBar(
          title: const Text(AppString.solution),
          centerTitle: true,
          backgroundColor: AppColor.bgColor,
        ),
        body: Container(
          padding:
              EdgeInsets.symmetric(horizontal: AppSizes.horizontal_padding),
          child: ListView.separated(
            itemCount: qtn.length,
            itemBuilder: (context, index) {
              count = index + 1;
              // UserModel userModel = homeViewModel.userListModel[index];
              return Column(children: [
                Wrap(children: [
                  solutionText(count.toString() + ")", AppSizes.medium_text,
                      FontWeight.w500, AppColor.whiteColor),
                  questionsBox(qtn[index]['qtn'])
                ]),
                Image.asset(qtn[index]['img'])
              ]);

              // UserListRow(
              //   userModel: userModel,
              //   ontap: ()async{
              //   homeViewModel.setSelectedUser(userModel);
              //   openUserDetail(context );
              // }, );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
        ));
  }

  questionsBox(question) {
    return solutionText(
        question, AppSizes.small_text, FontWeight.w500, AppColor.whiteColor);
  }

  solutionText(text, fontSize, fontWeight, color) {
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
