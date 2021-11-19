import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/Services/Category_Services/Category_Services.dart';
import 'package:ecommerce/model/category_model.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final Category_services _category_services;
  StreamSubscription? categorysubscription;

  CategoryBloc({required Category_services category_services})
      : _category_services = category_services,
        super(CategoryLoading());

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is CategoryLoaded) {
      yield* _mapCategoryLoadedToState();
    } else if (event is CategoryUpdate) {
      yield* _mapCategoryUpdate(event);
    }
  }

  Stream<CategoryState> _mapCategoryLoadedToState() async* {
    categorysubscription?.cancel();
    try {
      categorysubscription = _category_services
          .getAllCategory()
          .listen((event) => add(CategoryUpdate(event)));
    } catch (_) {}
  }

  Stream<CategoryState> _mapCategoryUpdate(CategoryUpdate event) async* {

    try {
      yield CategoryLoadeds(category: event.category);
    } catch (_) {}
  }
}
