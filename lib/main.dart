import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:quiz_app/src/core/utilities/size-config.dart';
import 'package:quiz_app/src/features/authentication/view/reset_password.dart';
import 'package:quiz_app/src/features/authentication/view_model/user_view_model.dart';
import 'package:quiz_app/src/features/bottom_nav/bottom_nav.dart';
import 'package:quiz_app/src/features/home/view/question_screen.dart';
import 'package:quiz_app/src/features/home/view/result_screen.dart';
import 'package:quiz_app/src/features/home/view_model/home_view_model.dart';

import 'src/features/authentication/view/sign_in.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
                ChangeNotifierProvider(create: (_) => UserViewModel()),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  //uses a build method to rendered the MateriaApp
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'PlayKosmos',
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const SignInScreen();
  }
}
