import 'package:ecommerce/model/model.dart';
import 'package:flutter/material.dart';

class HeroCarousel extends StatelessWidget {
  const HeroCarousel({Key? key, this.category_models, this.product})
      : super(key: key);
  final Category_model? category_models;
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(this.product ==null){
         Navigator.pushNamed(context, '/catalog',arguments: category_models);
        }
       
      },
      child: Container(
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(product==null? category_models!.imgURl: product!.ImgURL,
                      fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      child: Text(product==null? category_models!.name: '',
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: Colors.white)),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
