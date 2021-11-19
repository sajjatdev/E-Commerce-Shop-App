import 'package:ecommerce/logic/Cart/cart_bloc.dart';
import 'package:ecommerce/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCartPage extends StatefulWidget {
  final Product product;
  final int Quantity;

  const ProductCartPage({Key? key, required this.product,required this.Quantity}) : super(key: key);

  @override
  _ProductCartPageState createState() => _ProductCartPageState();
}

class _ProductCartPageState extends State<ProductCartPage> {
  int Counter = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            widget.product.ImgURL,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '\$${widget.product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<CartBloc>(context)
                            .add(Addproductincart(widget.product));
                        setState(() {
                          Counter++;
                        });
                      },
                      icon: Icon(Icons.add_circle)),
                  Text(
                    "${widget.Quantity}",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.black),
                  ),
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<CartBloc>(context)
                            .add(removeproductincart(widget.product));
                        setState(() {
                          Counter--;
                        });
                      },
                      icon: Icon(Icons.remove_circle)),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
