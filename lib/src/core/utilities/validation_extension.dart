import 'package:flutter/material.dart';

extension ValidationExtension on BuildContext {
  // email validator
  String? emailValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Invalid Email Format';
    }
  }

  // validate password
  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "Please Enter your password";
    } else if (value.length < 6) {
      return "password must be minimum of 6 characters";
    }
    else
      return null;
  }

 

   // username validator
  String? usernameValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your username';
    } else if (value!.length < 5) {
      return 'Username too short';
    } else {
      return null;
    }
  }

  
}
