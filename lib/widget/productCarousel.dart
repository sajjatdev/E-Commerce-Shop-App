import 'package:ecommerce/model/model.dart';
import 'package:ecommerce/widget/widget.dart';
import 'package:flutter/material.dart';

class Product_Carousel extends StatelessWidget {
  final List<Product> product;
  const Product_Carousel({
    Key? key, required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        itemCount: product.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
        return  Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: ProductCard(product: product[index], widthfactor: 2.5,),
        );
      }),
    );
  }
}

