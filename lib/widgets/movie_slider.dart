import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  MovieSlider({required this.movies, this.title, required this.onNextPage});

  @override
  _MovieSliderState createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrolController = new ScrollController();

  @override
  void initState() {
    //Se ejecuta cuando se construye por primera vez el widget
    super.initState();

    scrolController.addListener(() {
      if(scrolController.position.pixels>= scrolController.position.maxScrollExtent - 500 ){
        //LLamar provider
        widget.onNextPage();
        print('Obetenr siguiente pagina');
      }
    });

  }

  @override
  void dispose() {
    //Se ejecuta para destruir el widget y que no siga ocupando memoria
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (this.widget.movies.length == 0) {
      return Container(
        width: double.infinity,
        height: 260,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      width: double.infinity,
      height: 260,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.title ?? 'Popular',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              controller: scrolController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) =>
                  _MoviePoster(movie: widget.movies[index]),
              itemCount: widget.movies.length,
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;

  const _MoviePoster({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      //color: Colors.green,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  image: NetworkImage(movie.flullPosterImg),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            movie.title,
            overflow: TextOverflow
                .ellipsis, //Que cuando no haya más espacio ponga ...
            maxLines: 2, //Maximo de lineas de texto
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
