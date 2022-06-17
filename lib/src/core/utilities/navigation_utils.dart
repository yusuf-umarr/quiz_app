import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/src/features/authentication/view/sign_in.dart';

import '../../features/bottom_nav/view/bottom_nav.dart';

void openBottomNav(BuildContext context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav()));
}
void openBottomNaviagtor(BuildContext context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav()));
}
// void openAddUser(BuildContext context) async {
//   Navigator.push(context, MaterialPageRoute(builder: (context) => AddUserScreen()));
// }

// Navigator.of(context).push(SignInRoute()



Route BottomNavRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>  BottomNav(),
transitionsBuilder: (context, animation, secondaryAnimation, child) {
  const begin = Offset(0.0, 1.0);
  const end = Offset.zero;
  final tween = Tween(begin: begin, end: end);
  final offsetAnimation = animation.drive(tween);

  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
},
  );
}
Route SignInRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>  SignInScreen(),
transitionsBuilder: (context, animation, secondaryAnimation, child) {
  const begin = Offset(0.0, 1.0);
  const end = Offset.zero;
  const curve = Curves.ease;

  final tween = Tween(begin: begin, end: end);
  final curvedAnimation = CurvedAnimation(
    parent: animation,
    curve: curve,
  );

  return SlideTransition(
    position: tween.animate(curvedAnimation),
    child: child,
  );
}
  );
}