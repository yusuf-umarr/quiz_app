import 'package:flutter/cupertino.dart';

import '../../core/constants/app_image.dart';
import '../../core/constants/app_string.dart';
import 'model/onboard_model.dart';

class OnboadViewModel extends ChangeNotifier {
  var selectedPageIndex = 0;
  var pageController = PageController();

  List<OnboardModel> onboardList = [
    OnboardModel(AppString.onboard_title_one, AppString.onboard_desc_one,
        AppImage.onboard_two),
    OnboardModel(AppString.onboard_title_two, AppString.onboard_desc_two,
        AppImage.onboard_seven),
    OnboardModel(AppString.onboard_title_three, AppString.onboard_desc_three,
        AppImage.onboard_six),
    OnboardModel(AppString.onboard_title_four, AppString.onboard_desc_four,
        AppImage.onboard_eight),
  ];

  openNextIndex(int page) {
    selectedPageIndex = page;
    notifyListeners();
  }


 
}