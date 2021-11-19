import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Services/Category_Services/Base_Category_Services.dart';
import 'package:ecommerce/model/category_model.dart';

class Category_services extends Base_Category {
  final FirebaseFirestore _firebaseFirestore;

  Category_services({FirebaseFirestore? firebaseFirestores})
      : _firebaseFirestore = firebaseFirestores ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category_model>> getAllCategory() {
    return _firebaseFirestore.collection("category").snapshots().map((shopt){
      return shopt.docs.map((e) => Category_model.fromSnapshop(e)).toList();
    });
  }
}
