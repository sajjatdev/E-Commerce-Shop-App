part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();
}
class wishliststart extends WishlistEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AddWishlistProduct extends WishlistEvent{
 final Product product;

  AddWishlistProduct({required this.product});
  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class removewishlistProduct extends WishlistEvent{
  final Product product;

  removewishlistProduct({required this.product});

  @override
  // TODO: implement props
  List<Object?> get props => [product];
}