import 'package:ecommerce/model/model.dart';
import 'package:equatable/equatable.dart';

class Wishlist extends Equatable{
  final List<Product> products;

 const Wishlist({this.products=const <Product>[]});
  @override
  // TODO: implement props
  List<Object?> get props => [products];

}