import 'package:flutter/material.dart';

class Custome_NavBar extends StatelessWidget {
  const Custome_NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 70.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                icon: Icon(Icons.home,color: Colors.white,)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
                icon: Icon(Icons.shopping_cart,color: Colors.white)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                icon: Icon(Icons.person,color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
