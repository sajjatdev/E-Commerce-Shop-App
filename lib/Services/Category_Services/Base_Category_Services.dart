import 'package:ecommerce/model/model.dart';

abstract class Base_Category{
  Stream<List<Category_model>> getAllCategory();
}