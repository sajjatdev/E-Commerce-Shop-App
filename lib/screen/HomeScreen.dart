import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/logic/Category/category_bloc.dart';
import 'package:ecommerce/model/model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => HomeScreen());
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custome_AppBar(title: "FivHire RedShop"),
      bottomNavigationBar: Custome_NavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
               if(state is CategoryLoading){
                 return Container(child: CircularProgressIndicator(),);
               }else if(state is CategoryLoadeds){
                 return CarouselSlider(
                   options: CarouselOptions(
                     aspectRatio: 1.5,
                     viewportFraction: 0.9,
                     enlargeCenterPage: true,
                     enlargeStrategy: CenterPageEnlargeStrategy.height,
                   ),
                   items: state.category
                       .map((categorys) => HeroCarousel(
                     category_models: categorys,
                   ))
                       .toList(),
                 );
               }else {
                 return Container(child: Text("Error"),);
               }
              },
            )),
            SectionTitle(
              title: "RECOMMENDED",
            ),
            Product_Carousel(
              product: Product.productlist
                  .where((product) => product.IsRecommended)
                  .toList(),
            ),
            SectionTitle(
              title: "POPULAR",
            ),
            Product_Carousel(
              product: Product.productlist
                  .where((product) => product.IsPopular)
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
