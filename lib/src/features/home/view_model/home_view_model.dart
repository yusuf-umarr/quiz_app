import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/src/widgets/question_list.dart';

class HomeViewModel extends ChangeNotifier {
  var questions = getIt.get<QuestionList>().questions;

  var pageController = PageController();

  var selectedPageIndex = 0;

  var selectedAns;
  bool isCorrect = false;
  bool isLastAns = false;

  int score = 0;

  bool selectedOption = false;
  openNextIndex(int page) {
    selectedPageIndex = page;
    // print('current page: ${page}');
    notifyListeners();
  }

  bool get isLastPage => selectedPageIndex == questions.length - 1;

  bool get isFirstPage => selectedPageIndex == questions[0];

  prevPage() {
    if (!isFirstPage) {
      pageController.previousPage(
          duration: const Duration(milliseconds: 400), curve: Curves.ease);
    }
  }

  nextPage() {
    if (!isLastPage) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 700), curve: Curves.ease);
    }
  }

  setSelectedAns(ans) {
    selectedAns = ans;
    notifyListeners();
  }

  setIsCorrectAns(isTrue) {
    isCorrect = isTrue;
    notifyListeners();
  }

  resetScore() {
    isCorrect = false;
    notifyListeners();
  }

  totgleLastAns() {
    isLastAns = true;
    // print(isLastAns);
    notifyListeners();
  }

  resetPageController() {
    pageController.jumpToPage(0);
    // score = 0; 
    notifyListeners();
  }


}
