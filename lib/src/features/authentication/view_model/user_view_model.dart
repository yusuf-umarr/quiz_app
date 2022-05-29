import 'package:flutter/material.dart';
import 'dart:io' as io;

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UserViewModel extends ChangeNotifier{


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

}