import 'package:flutter/material.dart';
import 'package:peliculas/src/models/movie_model.dart';

import 'package:peliculas/src/providers/movie_provider.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';



class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final movieProvicer = MovieProvicer();
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox( height: 10),
              _swiperTarjetas()
            ],
          ),
        ),
      )
    );
  }

  Widget _swiperTarjetas(){

    return FutureBuilder(
      future: movieProvicer.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if(snapshot.hasData){
          return CardSwiperWidget(peliculas: snapshot.data!,);
        }else{
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }
        
      },
    );
    /* movieProvicer.getEnCines();

    return CardSwiperWidget(
      peliculas: [1, 2, 3, 4, 5],
    ); */
  }
}