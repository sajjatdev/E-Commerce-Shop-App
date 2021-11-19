import 'package:ecommerce/logic/wishlist/wishlist_bloc.dart';
import 'package:ecommerce/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => WishlistScreen());
  }

  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custome_AppBar(title: "Wishlist"),
      bottomNavigationBar: Custome_NavBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is Loading) {
            return Center(
              
              child: CircularProgressIndicator(),
            );
          } else if (state is Loaded) {
            return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.15,
                  crossAxisCount: 2,
                ),
                itemCount: state.wishlist.products.length,
                itemBuilder: (BuildContext context, index) {
                  return Center(
                    child: ProductCard(
                      product: state.wishlist.products[index],
                      widthfactor: 2.5,
                    ),
                  );
                });
          } else {
            return Container(color: Colors.red,);
          }
        },
      ),
    );
  }
}
