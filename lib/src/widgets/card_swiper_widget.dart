import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:peliculas/src/models/movie_model.dart';

class CardSwiperWidget extends StatelessWidget {
  //const CardSwiperWidget({ Key? key }) : super(key: key);
  
  final List<Movie> peliculas;

  CardSwiperWidget({required this.peliculas});
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return CarouselSlider.builder(
          itemCount: this.peliculas.length,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image: NetworkImage(peliculas[itemIndex].getPosterImg() ), 
              placeholder: AssetImage('assets/img/no-image.jpg'),
              fit: BoxFit.cover,
            )
          ),
          options: CarouselOptions(
            autoPlay: true,//Hace que pase pestañas solo
            aspectRatio: 2.0,
            enlargeCenterPage: true,//Hace que la pagina central se vea más grande
          ),
        );
  }
}