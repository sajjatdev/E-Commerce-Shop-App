import 'package:ecommerce/Services/Category_Services/Category_Services.dart';
import 'package:ecommerce/config/AppRoute.dart';
import 'package:ecommerce/config/ThemeData.dart';
import 'package:ecommerce/logic/Cart/cart_bloc.dart';
import 'package:ecommerce/logic/Category/category_bloc.dart';
import 'package:ecommerce/logic/wishlist/wishlist_bloc.dart';
import 'package:ecommerce/screen/Screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screen/HomeScreen.dart';
import 'widget/custome_appbar.dart';
import 'widget/custome_navBar.dart';

void main() async{
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WishlistBloc()..add(wishliststart())),
        BlocProvider(create: (context) => CartBloc()..add(CartStart())),
        BlocProvider(create: (context)=> CategoryBloc(category_services: Category_services()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "FivHire RedShop",
        theme: theme(),
        home: HomeScreen(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: splashScreen.routeName,
      ),
    );
  }
}
