import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas en Cines'),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_off_outlined)
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Tarjetas Principales
              CardSwiper(),
              //Listado horizontal de Peliculas
              MovieSlider(),
              
            ],
          ),
        ),
    );
  }
}