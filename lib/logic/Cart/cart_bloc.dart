import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/model/model.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(Loading());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if(event is CartStart){
      yield* _mapCartstartToState();
    }else if(event is Addproductincart){
      yield* _mapAddProductCart(state,event);
    }else if(event is removeproductincart){
      yield* _mapRemoveProduct(state,event);
    }
  }

  Stream<CartState> _mapCartstartToState()async*{
    yield Loading();
    try{
      Future.delayed(Duration(seconds: 10));
      yield Loaded();
    }catch(_){}
  }
  Stream<CartState> _mapAddProductCart(state,event)async*{
    if (state is Loaded) {
      yield Loaded(cart: Cart(productlist:List.from(state.cart.productlist)..add(event.product) ));
    }
  }
  Stream<CartState> _mapRemoveProduct(state,event)async*{
    if (state is Loaded) {
      yield Loaded(cart: Cart(productlist: List.from(state.cart.productlist)..remove(event.product)));
    }
  }
}
