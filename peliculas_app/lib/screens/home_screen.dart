import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }):
        super( key: key );

  @override
  Widget build(BuildContext context) {

    // obtenemos una instancia de movies provider desde el main
    final moviesProvider = Provider.of<MoviesProvider>( context );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon( Icons.search_outlined )
          )
        ],
        title: const Text('Movies in Cinemas'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // tarjetas principales
            CardSwiper( movies: moviesProvider.onDisplayMovies ),

            // slider de peliculas
            MovieSlider(
              movies: moviesProvider.onPopularMovies,
            ),
          ],
        ),
      )
    );
  }
}