part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryLoading extends CategoryState {
  @override
  List<Object> get props => [];
}
class CategoryLoadeds extends CategoryState {
  final List<Category_model> category;

  CategoryLoadeds({this.category=const <Category_model>[]});
  @override
  List<Object> get props => [category];
}
