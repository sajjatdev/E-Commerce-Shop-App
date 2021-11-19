import 'package:ecommerce/model/model.dart';
import 'package:ecommerce/widget/widget.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category_model Category}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => CatalogScreen(
              Category: Category,
            ));
  }

  CatalogScreen({Key? key, required this.Category}) : super(key: key);
  final Category_model Category;

  @override
  Widget build(BuildContext context) {
    final List<Product> category_product = Product.productlist
        .where((Product) => Product.Category == Category.name)
        .toList();

    return Scaffold(
      appBar: Custome_AppBar(title: "Catalog"),
      bottomNavigationBar: Custome_NavBar(),
      body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.15,
            crossAxisCount: 2,
          ),
          itemCount: category_product.length,
          itemBuilder: (BuildContext context, index) {
            return Center(
              child: ProductCard(
                product: category_product[index], widthfactor: 2.5,
              ),
            );
          }),
    );
  }
}
