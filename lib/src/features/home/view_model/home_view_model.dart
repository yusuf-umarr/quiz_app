import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/question_model.dart';

class HomeViewModel extends ChangeNotifier {
  // var questions = getIt.get<GetAppList>().questions;

  var pageController = PageController();

  var selectedPageIndex = 0;

  openNextIndex(int page) {
    selectedPageIndex = page;
    print('current page: ${page}');
    notifyListeners();
  }

  List questions = [
    {
      "id": "001",
      "qtn":
          "In how many ways can a committee of 4 people be chosen out of 8 people?",
      "option": [
        {"opt": "32", "isTrue": false},
        {"opt": "52", "isTrue": false},
        {"opt": "70", "isTrue": false},
        {"opt": "79", "isTrue": false},
      ]
    },
    {
      "id": "002",
      "qtn":
          "In how many ways, a committee of 6 members be selected from 7 men and 5 ladies, consisting of 4 men and 2 ladies?",
      "option": [
        {"opt": "250", "isTrue": false},
        {"opt": "350", "isTrue": false},
        {"opt": "450", "isTrue": false},
        {"opt": "550", "isTrue": false},
      ]
    },
    {
      "id": "003",
      "qtn":
          "A committee of 5 members is to be formed by selecting out 4 men and 5 women. In how many different ways the committee can be formed if it should have 2 men and 3 women?",
      "option": [
        {"opt": "30", "isTrue": false},
        {"opt": "60", "isTrue": false},
        {"opt": "70", "isTrue": false},
        {"opt": "80", "isTrue": false},
      ]
    },
  ];

  // List<QuestionModel> questionList = [
  //   QuestionModel(
  //     id:"001",
  //       qtn:"In how many ways can a committee of 4 people be chosen out of 8 people?",
  //       option: Option

  //       ),
  //   QuestionModel(
  //     id:"002",
  //     qtn:
  //       "In how many ways, a committee of 6 members be selected from 7 men and 5 ladies, consisting of 4 men and 2 ladies?",
  //     option:Option),
  //   QuestionModel(
  //     id:"003",
  //     qtn:
  //       "A committee of 5 members is to be formed by selecting out 4 men and 5 women. In how many different ways the committee can be formed if it should have 2 men and 3 women?",
  //       option:Option),

  // ];

  // List<Option> optionList = [
  //   Option(a: "32", b: "52", c: "70", d: "79"),
  //   Option(a: "250", b: "350", c: "450", d: "550"),
  //   Option(a: "70", b: "60", c: "70", d: "80"),
  // ];
}
