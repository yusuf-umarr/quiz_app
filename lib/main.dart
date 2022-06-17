import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/src/core/utilities/size-config.dart';
import 'package:quiz_app/src/features/authentication/view_model/user_view_model.dart';
import 'package:quiz_app/src/features/bottom_nav/view/bottom_nav.dart';
import 'package:quiz_app/src/features/bottom_nav/view_model/bottom_nav_view_model.dart';
import 'package:quiz_app/src/features/home/view_model/home_view_model.dart';
import 'package:quiz_app/src/features/starter/onboard_view_model.dart';
import 'package:quiz_app/src/features/starter/view/onboard_screen.dart';
import 'package:quiz_app/src/widgets/question_list.dart';
import 'package:shared_preferences/shared_preferences.dart';


GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
        SharedPreferences sharePreference = await SharedPreferences.getInstance();
        var token = sharePreference.getString('token');

  getIt.registerSingleton<QuestionList>(QuestionList(), signalsReady: true);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboadViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => BottomNavViewModel()),
      ],
      child:  MyApp(token: token,),
    ),
  );
}

class MyApp extends StatelessWidget {
  var token;
   MyApp({Key? key, required this.token}) : super(key: key);

  @override
  //uses a build method to rendered the MateriaApp
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'PlayKosmos',
      debugShowCheckedModeBanner: false,
      home: MyHome(token: token,),
    );
  }
}

class MyHome extends StatelessWidget {
  var token;
   MyHome({Key? key, required this.token}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return token !=null ? BottomNav() :  OnboardScreen();
  }
}
