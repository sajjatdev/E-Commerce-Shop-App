import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/logic/Cart/cart_bloc.dart';
import 'package:ecommerce/logic/wishlist/wishlist_bloc.dart';
import 'package:ecommerce/model/model.dart';
import 'package:ecommerce/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route({required Product products}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => ProductScreen(
              product: products,
            ));
  }

  const ProductScreen({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custome_AppBar(title: product.name),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    )),
                BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                    return IconButton(
                        onPressed: () {
                          print("Hello");
                          BlocProvider.of<WishlistBloc>(context)
                              .add(AddWishlistProduct(product: product));
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ));
                  },
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {
                          BlocProvider.of<CartBloc>(context)
                              .add(Addproductincart(product));
                          Navigator.of(context).pushNamed("/cart");
                        },
                        child: Text(
                          "ADD TO CART",
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: Colors.black),
                        ));
                  },
                )
              ],
            ),
          ),
        ),
        body: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: [
                HeroCarousel(
                  product: product,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    alignment: Alignment.bottomCenter,
                    color: Colors.black.withAlpha(50),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width - 10,
                    height: 50,
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            '\$${product.price}',
                            style: Theme.of(context).textTheme.headline2,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            //product information
            ExpansionTiles(
              tiitle: 'Product Information',
              subtitle:
                  'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.',
              init: true,
            ),

            //deliver information

            ExpansionTiles(
              tiitle: 'Delivery Information',
              subtitle:
                  'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.',
              init: false,
            ),
          ],
        ));
  }
}
