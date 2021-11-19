import 'package:ecommerce/model/model.dart';

abstract class Base_Product{
  Stream<List<Product>> getAllProduct();
}