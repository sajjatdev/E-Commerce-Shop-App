part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();
}

class WishlistInitial extends WishlistState {
  @override
  List<Object> get props => [];
}
class Loading extends WishlistState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Loaded extends WishlistState{
  final Wishlist wishlist;

  Loaded({this.wishlist=const Wishlist()});

  @override
  // TODO: implement props
  List<Object?> get props => [wishlist];
}