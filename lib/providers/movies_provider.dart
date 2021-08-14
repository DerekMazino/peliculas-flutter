import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class MoviesProvider extends ChangeNotifier{

  String _apiKey = 'a3d671ebb0f9539f9ca31a80b0b59c15';
  String _baseUrl = 'api.themoviedb.org';
  String _lenguage = 'es-ES';

  MoviesProvider(){
    print('Movies Provier Inicializado');

    this.getOnDisplayMovies();
  }


  getOnDisplayMovies() async{
    var url =
      Uri.https(this._baseUrl, '3/movie/now_playing', {
        'api_key': _apiKey,
        'language': _lenguage,
        'page': '1'
      });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(response.body) ;
    print(decodedData);
  }

}