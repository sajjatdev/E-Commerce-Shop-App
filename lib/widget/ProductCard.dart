import 'package:ecommerce/logic/Cart/cart_bloc.dart';
import 'package:ecommerce/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthfactor;
  final double liftposition;
  final bool iswishlist;

  const ProductCard({
    Key? key,
    required this.product,
    required this.widthfactor,
    this.liftposition = 5,
    this.iswishlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.00),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/product", arguments: product);
        },
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / widthfactor,
              height: 150,
              child: Image.network(
                product.ImgURL,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 60,
              left: liftposition,
              child: Container(
                width: MediaQuery.of(context).size.width / widthfactor -
                    5 -
                    liftposition,
                height: 80,
                decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
              ),
            ),
            Positioned(
              top: 65,
              left: liftposition + 5,
              child: Container(
                width: MediaQuery.of(context).size.width / widthfactor -
                    10 -
                    liftposition,
                height: 70,
                decoration: BoxDecoration(color: Colors.black),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              '\$${product.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        return IconButton(
                            onPressed: () {
                              BlocProvider.of<CartBloc>(context)
                                  .add(Addproductincart(product));
                            },
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ));
                      },
                    )),
                    iswishlist
                        ? Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )))
                        : SizedBox(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
