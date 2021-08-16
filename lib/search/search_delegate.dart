import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar Pelicula';

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(onPressed: () => query = '', icon: Icon(Icons.clear))];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: () {
      close(context, null);
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('buildResults');
  }

  Widget _emptyCntainer(){
    return Container(
        child: Center(
          child: Icon(Icons.movie_creation_outlined, color:Colors.black38, size: 130,),
        ),
      ); 
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if(query.isEmpty){
      return _emptyCntainer();
    }

    final moviesProvider = Provider.of<MoviesProvider>(context, listen:false);

    return FutureBuilder(
      future: moviesProvider.searchMovie(query),
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if(!snapshot.hasData) return _emptyCntainer();

        final movies = snapshot.data!;

        return ListView.builder(
          itemBuilder: (_, int index) => _MovieItem(movie: movies[index],),
          itemCount: movies.length,);
      },
    );
  }
}


class _MovieItem extends StatelessWidget {
  final Movie movie;
  const _MovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: AssetImage('assets/img/no-image.jpg'),
        image: NetworkImage(movie.flullPosterImg),
        width: 50,
        fit: BoxFit.contain,
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: movie);
      },
    );
  }
}