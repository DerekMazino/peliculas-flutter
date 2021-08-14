

import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier{

  MoviesProvider(){
    print('Movies Provier Inicializado');

    this.getOnDisplayMovies();
  }


  getOnDisplayMovies(){
    print('getOnDisplayMovies');
  }

}