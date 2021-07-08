import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class CardSwiperWidget extends StatelessWidget {
  //const CardSwiperWidget({ Key? key }) : super(key: key);
  
  final List<dynamic> peliculas;

  CardSwiperWidget({required this.peliculas});
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10),
      child: CarouselSlider.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              "http://via.placeholder.com/350x150",
              fit: BoxFit.cover,),
          ),
          options: CarouselOptions(
            autoPlay: true,//Hace que pase pestañas solo
            aspectRatio: 2.0,
            enlargeCenterPage: true,//Hace que la pagina central se vea más grande
          ),
        ),
    );
  }
}