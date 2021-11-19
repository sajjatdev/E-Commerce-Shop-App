import 'dart:async';

import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => splashScreen());
  }

  splashScreen();

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Welcome to FivHire",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black),
        )
      ],
    ));
  }
}
