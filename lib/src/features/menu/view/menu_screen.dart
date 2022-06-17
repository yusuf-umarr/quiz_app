import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/shared_service.dart';
import '../../authentication/model/login_response_model.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  var user;
  @override
  void initState() {
    super.initState();
    getUserData();

    // print(loginModel.fullName);
  }

  getUserData() async {
    SharedPreferences sharePreference = await SharedPreferences.getInstance();
    user = sharePreference.getString('user');

    var outputUser = jsonDecode(user);

    // print(outputUser);
    // print(outputUser.runtimeType);
    print(outputUser['fullName']);
  }

  printUser() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Column(
        children: [
          Center(
            child: InkWell(
                onTap: () {
                  SharedService.logout(context);
                },
                child: Text("LogOut")),
          ),
        ],
      )),
    );
  }
}
