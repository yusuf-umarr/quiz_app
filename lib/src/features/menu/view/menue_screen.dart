import 'package:flutter/material.dart';

import '../../../services/shared_service.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: InkWell(
          onTap: () {
            SharedService.logout(context);
          },
          child: Text("LogOut")),
    ));
  }
}
