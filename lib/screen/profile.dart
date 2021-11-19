import 'package:ecommerce/widget/widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => ProfileScreen());
  }

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custome_AppBar(title: "Profile"),
      bottomNavigationBar: Custome_NavBar(),
    );
  }
}
