part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}
class CategoryLoaded extends CategoryEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class CategoryUpdate extends CategoryEvent{
  final List<Category_model> category;

  CategoryUpdate(this.category);
  @override
  // TODO: implement props
  List<Object?> get props => [category];
}