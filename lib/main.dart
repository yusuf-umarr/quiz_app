import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:quiz_app/src/core/utilities/size-config.dart';
import 'package:quiz_app/src/features/bottom_nav/bottom_nav.dart';
import 'package:quiz_app/src/features/home/view_model/home_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
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
    return const BottomNav();
  }
}
