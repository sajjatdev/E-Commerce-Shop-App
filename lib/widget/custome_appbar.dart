import 'package:ecommerce/logic/wishlist/wishlist_bloc.dart';
import 'package:ecommerce/screen/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Custome_AppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  Custome_AppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      title: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),
          ),
        ),
        color: Colors.black,
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, WishlistScreen.routeName);
            },
            icon: Icon(Icons.favorite))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}
