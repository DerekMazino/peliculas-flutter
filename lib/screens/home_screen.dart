import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);
    //print(moviesProvider.onDisplayMovies);
    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas en Cines'),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()),
              icon: Icon(Icons.search)
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Tarjetas Principales
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              //Listado horizontal de Peliculas
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares!',//Opcional
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
              
            ],
          ),
        ),
    );
  }
}