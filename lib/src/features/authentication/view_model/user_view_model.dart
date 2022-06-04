import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/constants/app_color.dart';

class UserViewModel extends ChangeNotifier {
  var selectedPageIndex = 0;
  var pageController = PageController();
  bool isSecure = true;
  io.File? profileImage;

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

  passwordVisibility() {
    return IconButton(
      icon: Icon(isSecure ? Icons.visibility_off : Icons.visibility,
          color: AppColor.iconColor),
      onPressed: () {
        isSecure = !isSecure;
        notifyListeners();
     
      },
    );
  }



}
