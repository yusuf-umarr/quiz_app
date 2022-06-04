import 'package:quiz_app/src/core/constants/app_image.dart';

class QuestionList{
   List questions = [
    {
      "id": "001",
      "qtn":
          "In how many ways can a committee of 4 people be chosen out of 8 people?",
      "option": [
        {"opt": "32", "isTrue": false},
        {"opt": "52", "isTrue": false},
        {"opt": "70", "isTrue": true},
        {"opt": "79", "isTrue": false},
      ], "img":AppImage.math_s1,
     
    },
    {
      "id": "002",
      "qtn":
          "In how many ways, a committee of 6 members be selected from 7 men and 5 ladies, consisting of 4 men and 2 ladies?",
      "option": [
        {"opt": "250", "isTrue": false},
        {"opt": "350", "isTrue": true},
        {"opt": "450", "isTrue": false},
        {"opt": "550", "isTrue": false},
      ], "img":AppImage.math_s2,
    },
    {
      "id": "003",
      "qtn":
          "A committee of 5 members is to be formed by selecting out 4 men and 5 women. In how many different ways the committee can be formed if it should have 2 men and 3 women?",
      "option": [
        {"opt": "30", "isTrue": false},
        {"opt": "60", "isTrue": true},
        {"opt": "70", "isTrue": false},
        {"opt": "80", "isTrue": false},
      ], "img":AppImage.math_s3,
    },
  ];
}