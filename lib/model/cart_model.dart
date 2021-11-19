import 'dart:ffi';

import 'package:ecommerce/model/model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> productlist;

  const Cart({this.productlist = const <Product>[]});

  double get subtotal =>
      productlist.fold(0, (total, current) => total + current.price);

  String freeDeliveryFee(subtotal) {
    if (subtotal >= 30.0) {
      return "Add \$${5.0} for FREE Delivery";
    } else {
      double missing = 30.0 - subtotal;
      String  values= missing.toStringAsFixed(2);
      return "Add \$${values} for FREE Delivery";
    }
  }

  double deliverfee(subtotal) {
    if (subtotal >= 30.0) {
      return 30.0;
    } else
      return 5.0;
  }

  double total(subtotal, deliverfee) {
    return subtotal + deliverfee(subtotal);
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total(subtotal, deliverfee).toStringAsFixed(2);

  String get DeliveryfeeString => deliverfee(subtotal).toStringAsFixed(2);

  String get DeliveryMessage => freeDeliveryFee(subtotal);

  Map ProductQuantity(products) {
    var quantity = Map();
    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productlist];
}
