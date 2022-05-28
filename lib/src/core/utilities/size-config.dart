/*the following class defines the screen responsiveness of the application, 
this enable the application to scale across all screen

@author yusuf umar
@since 29-11-2021
*/

import 'package:flutter/material.dart';

class SizeConfig {
  //uses to store the screen width
  static double? _screenWidth;
  //uses to store the screen height
  static double? _screenHeight;
  //uses to store the height multiplier
  static double? heightMultiplier;
  //uses to store the width multiplier
  static double? widthMultiplier;

  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;

  static MediaQueryData? _mediaQueryData;

//this is used for managing the various screen sizes
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData?.size.width;
    _screenHeight = _mediaQueryData?.size.height;
    widthMultiplier = _screenWidth! / 100;
    heightMultiplier = _screenHeight! / 100;

    _safeAreaHorizontal =
        (_mediaQueryData!.padding.left + _mediaQueryData!.padding.right);

    _safeAreaVertical =
        (_mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom);

    safeBlockHorizontal = (_screenWidth! - _safeAreaHorizontal!) / 100;

    safeBlockVertical = (_screenHeight! - _safeAreaVertical!) / 100;
  }
}
