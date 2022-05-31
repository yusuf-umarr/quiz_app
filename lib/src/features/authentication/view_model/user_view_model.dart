import 'package:flutter/material.dart';
import 'dart:io' as io;

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constants/app_image.dart';
import '../../../core/constants/app_string.dart';
import '../model/onboard_model.dart';

class UserViewModel extends ChangeNotifier{
   var selectedPageIndex = 0;

  var pageController = PageController();


    io.File? profileImage;


    //profile image picker
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = io.File(image.path);

      this.profileImage = imageTemporary;
    } on PlatformException catch (e) {
      debugPrint('$e');
    }
    notifyListeners();
  }


 

  List<OnboardModel> onboardList = [
    OnboardModel(AppString.onboard_desc_one, AppImage.onboard_one),
    OnboardModel(AppString.onboard_desc_two, AppImage.onboard_two),
    OnboardModel(AppString.onboard_desc_three, AppImage.onboard_three),
    OnboardModel(AppString.onboard_desc_four, AppImage.onboard_four),

  ];

} 