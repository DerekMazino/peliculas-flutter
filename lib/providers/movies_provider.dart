
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/search_movie_response.dart';
class MoviesProvider extends ChangeNotifier{

  String _apiKey = 'a3d671ebb0f9539f9ca31a80b0b59c15';
  String _baseUrl = 'api.themoviedb.org';
  String _lenguage = 'es-ES';

  //Contendra instancias de Pelicula, es publico para poder llamarlo
  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  Map<int, List<Cast>> movieCast = {};

  int _popularPage = 0;

  MoviesProvider(){
    print('Movies Provier Inicializado');

    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endPoint, [int page = 1]) async{
    final url =
      Uri.https(this._baseUrl, endPoint, {
        'api_key': _apiKey,
        'language': _lenguage,
        'page': '$page'
      });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async{

    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    
    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    
    _popularPage ++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies ,...popularResponse.results];
    //print(popularMovies[0]);
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async{

    if(movieCast.containsKey(movieId)) return movieCast[movieId]!;
    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    movieCast[movieId] = creditsResponse.cast;

    print('Pidiendo info al sever de los actores');
    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovie(String query) async{
    final url =
      Uri.https(this._baseUrl, '3/search/movie', {
        'api_key': _apiKey,
        'language': _lenguage,
        'query': query
      });
    final response = await http.get(url);
    final searchMovieResponse  = SearchMovieResponse.fromJson(response.body);
    return searchMovieResponse.results;
  }

}