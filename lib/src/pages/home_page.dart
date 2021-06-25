import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pelicuals en Cine'),
        backgroundColor: Colors.indigoAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            _swiperTarjetas()
          ],
        ),
      )
    );
  }

  Widget _swiperTarjetas(){
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: CarouselSlider.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.amber
          ),
          child: Text('text ${itemIndex.toString()}', style: TextStyle(fontSize: 16.0),),
        ),
        options: CarouselOptions(
          autoPlay: true,//Hace que pase pestañas solo
          aspectRatio: 2.0,
          enlargeCenterPage: true,//Hace que la pagina central se vea más grande
        ),
      )
    );
  }
}