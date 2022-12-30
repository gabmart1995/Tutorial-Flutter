import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {

  Widget _emptyContainer() {
    return Container(
      child: const Center(
        child: Icon(
          Icons.movie_creation_outlined,
          color: Colors.black38,
          size: 130,
        ),
      ),
    );
  }

  @override
  String get searchFieldLabel {
    return 'Buscar pelicula';
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon( Icons.clear )
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close( context, null );
      },
      icon: const Icon( Icons.arrow_back )
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if ( query.isEmpty ) {
      return _emptyContainer();
    }

    final moviesProvider = Provider.of<MoviesProvider>( context, listen: false );

    return FutureBuilder(
      future: moviesProvider.searchMovie( query ),
      builder: ( _, AsyncSnapshot<List<Movie>> snapshot ) {

        if ( snapshot.hasData ) {
          return _emptyContainer();
        }

        final List<Movie> movies = snapshot.data!;

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: ( _, int index ) =>
        );
      }
    );
  }
}

class _