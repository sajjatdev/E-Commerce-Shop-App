import 'package:ecommerce/logic/Cart/cart_bloc.dart';
import 'package:ecommerce/model/model.dart';
import 'package:ecommerce/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => CartScreen());
  }

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custome_AppBar(title: "Cart"),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {},
                  child: Text(
                    "GO TO CHECKOUT",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is Loaded) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.cart.DeliveryMessage,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.black),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/");
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(),
                                elevation: 0,
                              ),
                              child: Text("Add More Item"))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.40,
                        child: BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            if (state is Loading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is Loaded) {
                              return ListView.builder(
                                  itemCount: state.cart
                                      .ProductQuantity(state.cart.productlist)
                                      .keys
                                      .length,
                                  itemBuilder: (context, index) {
                                    return ProductCartPage(
                                      product: state.cart
                                          .ProductQuantity(
                                              state.cart.productlist)
                                          .keys
                                          .elementAt(index),
                                      Quantity: state.cart
                                          .ProductQuantity(
                                              state.cart.productlist)
                                          .values
                                          .elementAt(index),
                                    );
                                  });
                            } else {
                              return Container(
                                child: Text("Error"),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Divider(thickness: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "SUBTOTAL",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(color: Colors.black),
                                ),
                                Text(
                                  "\$${state.cart.subtotalString}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(color: Colors.black),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "DELIVERY FEE",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(color: Colors.black),
                                ),
                                Text(
                                  "\$${state.cart.DeliveryfeeString}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(color: Colors.black),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        decoration:
                            BoxDecoration(color: Colors.black.withAlpha(50)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(5),
                        height: 70,
                        decoration: BoxDecoration(color: Colors.black),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "TOTAL",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white),
                              ),
                              Text(
                                "\$${state.cart.totalString}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          } else {
            return Container(
              child: Text("Error"),
            );
          }
        },
      ),
    );
  }
}
