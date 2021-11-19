part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}
class Loading extends CartState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Loaded extends CartState{
  final Cart cart;
  Loaded({this.cart=const Cart()});

  @override
  // TODO: implement props
  List<Object?> get props => [cart];
}