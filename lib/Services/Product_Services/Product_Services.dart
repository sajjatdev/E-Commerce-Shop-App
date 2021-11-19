import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Services/Product_Services/Base_Product_Services.dart';
import 'package:ecommerce/model/product_model.dart';

class Product_services extends Base_Product {
  final FirebaseFirestore _firebaseFirestore;

  Product_services({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProduct() {
    // TODO: implement getAllProduct
    return _firebaseFirestore.collection("Product").snapshots().map((snapshot) {
      return snapshot.docs.map((e) => Product.fromproductSnapshot(e)).toList();
    });
  }
}
