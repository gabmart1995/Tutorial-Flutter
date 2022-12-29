import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final String? title;

  const MovieSlider({
    Key? key,
    required this.movies,
    required this.onNextPage,
    this.title,
  }):
      super( key: key );

  final Function onNextPage;

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {

      // print( scrollController.position.pixels );
      // print( scrollController.position.maxScrollExtent );

      if (
        scrollController.position.pixels >=
        ( scrollController.position.maxScrollExtent - 500 )
      ) {
        // call provider
        widget.onNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    // loading
    if ( widget.movies.isEmpty ) {
      return Container(
        width: double.infinity,
        height: 250,
        child: const Center(
          child: CircularProgressIndicator( color: Colors.indigo ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          if ( widget.title != null )
            Padding(
              padding: const EdgeInsets.symmetric( horizontal: 20 ),
              child: Text(
                widget.title!,
                style: const TextStyle( fontSize: 20, fontWeight: FontWeight.bold ),
              ),
            ),

          const SizedBox( height: 5 ),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              // cambia la direccion del scroll
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: ( _, int index ) => _MoviePoster( widget.movies[index] ),
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Movie movie;

  const _MoviePoster(
      this.movie,
      { Key? key }
    ):
      super( key: key );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 200,
      margin: const EdgeInsets.symmetric( horizontal: 10 ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                'details',
                arguments: movie
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage( movie.fullPosterImg ),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox( height: 5 ),

          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}