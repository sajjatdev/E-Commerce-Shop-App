import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/model/model.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial());

  @override
  Stream<WishlistState> mapEventToState(
    WishlistEvent event,
  ) async* {
    // TODO: implement mapEventToState

    if(event is wishliststart){
      yield* _mapWishlistStart();
    }else if(event is AddWishlistProduct){
      yield* _mapaddwishlistProduct(state,event);
    }else if(event is removewishlistProduct){
      yield* _mapremovewishlistproduct(state,event);
    }
  }

  Stream<WishlistState>  _mapWishlistStart()async*{
    yield Loading();
    try{
      Future<void>.delayed(Duration(seconds: 5));
      yield Loaded();
    }catch(_){};
  }

  Stream<WishlistState> _mapaddwishlistProduct(state,event)async*{
    try{
      if(state is Loaded){
        yield Loaded(wishlist: Wishlist(products: List.from(state.wishlist.products)..add(event.product)));
      }
    }catch(_){

    }
  }

  Stream<WishlistState> _mapremovewishlistproduct(state,event)async*{
    try{
      if(state is Loaded){
        yield Loaded(wishlist: Wishlist(products: List.from(state.wishlist.products)..remove(event.product)));
      }
    }catch(_){

    }
  }
}
