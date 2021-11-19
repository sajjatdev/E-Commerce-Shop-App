import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Product extends Equatable {
  final String name;
  final String ImgURL;
  final String Category;
  final double price;
  final bool IsRecommended;
  final bool IsPopular;

  Product(
      {required this.name,
      required this.ImgURL,
      required this.Category,
      required this.price,
      required this.IsRecommended,
      required this.IsPopular});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, ImgURL, Category, price, IsRecommended, IsPopular];

  static Product fromproductSnapshot(DocumentSnapshot snapshot) {
    Product product = Product(
        name: snapshot["name"],
        ImgURL: snapshot["ImgURL"],
        Category: snapshot["Category"],
        price: snapshot["price"],
        IsRecommended: snapshot["IsRecommended"],
        IsPopular: snapshot["IsPopular"]);
    return product;
  }

  static List<Product> productlist = [
    Product(
        IsRecommended: true,
        IsPopular: true,
        price: 12.99,
        name: "Headphone",
        ImgURL:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnAbSH-ogWeMD4JF5urZIocaU91CxCqVVHaucZE4QbYTlevOcuc6z-Bzf2SoLStZ_zfvw&usqp=CAU",
        Category: 'Soft Drink'),
    Product(
        IsRecommended: true,
        IsPopular: true,
        price: 13.00,
        name: "Oil",
        ImgURL:
            "https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657__480.jpg",
        Category: 'Soft Drink'),
    Product(
        IsRecommended: true,
        IsPopular: false,
        price: 50.99,
        name: "Laptop",
        ImgURL:
            "https://cdn.pixabay.com/photo/2014/05/02/21/47/laptop-336369__340.jpg",
        Category: 'Water'),
    Product(
        IsRecommended: true,
        IsPopular: true,
        price: 30.99,
        name: "Strawberry",
        ImgURL:
            "https://cdn.pixabay.com/photo/2017/07/16/22/22/bath-oil-2510783__340.jpg",
        Category: 'Water'),
    Product(
        IsRecommended: true,
        IsPopular: false,
        price: 14.99,
        name: "Strawberry Ice",
        ImgURL:
            "https://cdn.pixabay.com/photo/2017/03/31/18/02/strawberry-dessert-2191973__340.jpg",
        Category: 'Smoothies'),
    Product(
        IsRecommended: true,
        IsPopular: true,
        price: 12.99,
        name: "Bread",
        ImgURL:
            "https://cdn.pixabay.com/photo/2018/06/10/20/30/bread-3467243__340.jpg",
        Category: 'Smoothies'),
    Product(
        IsRecommended: true,
        IsPopular: false,
        price: 17.99,
        name: "Nuts",
        ImgURL:
            "https://cdn.pixabay.com/photo/2017/11/22/22/53/nuts-2971675__340.jpg",
        Category: 'Smoothies'),
  ];
}
