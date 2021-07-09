import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:peliculas/src/models/movie_model.dart';

class MovieProvicer{
  String _apiKey = 'a3d671ebb0f9539f9ca31a80b0b59c15';
  String _url = 'api.themoviedb.org';
  String _language ='es-ES'; 

  Future<List<Movie>> getEnCines() async{
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key' : _apiKey,
      'language' : _language
    });
    final respuesta = await http.get(url);
    final decodeData = json.decode(respuesta.body);
    
    final movies = Movies.fromJsonList(decodeData['results']);

    return movies.items;
  }

}