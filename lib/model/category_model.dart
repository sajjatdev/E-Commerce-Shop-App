import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category_model extends Equatable {
  final String name;
  final String imgURl;

  Category_model({required this.name, required this.imgURl});

  @override
  // TODO: implement props
  List<Object?> get props => [name, imgURl];

  static Category_model fromSnapshop(DocumentSnapshot snapshot) {
    Category_model category_model =
        Category_model(name: snapshot["name"], imgURl: snapshot["imageURL"]);
    return category_model;
  }

  static List<Category_model> category = [
    Category_model(
        name: "Soft Drink",
        imgURl:
            "https://images.unsplash.com/photo-1527960471264-932f39eb5846?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c29mdCUyMGRyaW5rfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    Category_model(
        name: "Smoothies",
        imgURl:
            'https://images.unsplash.com/photo-1502741224143-90386d7f8c82?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c21vb3RoaWVzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
    Category_model(
        name: "Water",
        imgURl:
            "https://images.unsplash.com/photo-1564419431636-fe02f0eff7aa?ixid=MnwxMjA3fDF8MHxzZWFyY2h8MTV8fHdhdGVyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60")
  ];
}
