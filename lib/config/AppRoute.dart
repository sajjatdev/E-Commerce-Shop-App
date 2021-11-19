import 'package:ecommerce/model/model.dart';
import 'package:ecommerce/screen/Screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('this is Route:- ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case splashScreen.routeName:
        return splashScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();

      case ProfileScreen.routeName:
        return ProfileScreen.route();

      case ProductScreen.routeName:
        return ProductScreen.route(products: settings.arguments as Product);

      case CatalogScreen.routeName:
        return CatalogScreen.route(
            Category: settings.arguments as Category_model);

      case WishlistScreen.routeName:
        return WishlistScreen.route();
      default:
        return errorRoute();
    }
  }

  static Route errorRoute() {
    return MaterialPageRoute(
        settings: RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
            ));
  }
}
