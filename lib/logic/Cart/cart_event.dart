part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}
class CartStart extends CartEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Addproductincart extends CartEvent{
  final Product product;

  Addproductincart(this.product);

  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class removeproductincart extends CartEvent{
  final Product product;

  removeproductincart(this.product);

  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

