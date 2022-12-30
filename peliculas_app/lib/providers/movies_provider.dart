import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/helpers/debouncer.dart';
import 'package:peliculas_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {

  final String
    _baseUrl = 'api.themoviedb.org',
    _apiKey = '7ba08f3c510dceec4a5627b65563ee32',
    _language = 'es-ES';

  int _popularPage = 0;

  List<Movie>
    onDisplayMovies = [],
    onPopularMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  final debouncer = Debouncer(
    duration: const Duration( milliseconds: 500 )
  );

  final StreamController<List<Movie>>
    _suggestionsStreamController = StreamController.broadcast();

  // get stream
  Stream<List<Movie>> get suggestionStream {
    return _suggestionsStreamController.stream;
  }

  MoviesProvider() {
    getNowPlayMovies();
    getPopularMovies();
  }

  // realizamos las peticiones
  Future<String> _getJsonData( String endPoint, { int page = 1 }) async {

    Uri url = Uri.https( _baseUrl, endPoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': page.toString(),
    });

    final response = await http.get( url );
    return response.body;
  }

  getNowPlayMovies() async {

    final jsonData = await _getJsonData( '3/movie/now_playing' );
    final nowPlayingResponse = NowPlayingResponse.fromJson( jsonData );

    onDisplayMovies = nowPlayingResponse.results;

    // disparamos la notificacion
    notifyListeners();
  }

  getPopularMovies() async {

    _popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', page: _popularPage );
    final popularResponse = PopularResponse.fromJson( jsonData );

    onPopularMovies = [ ...onPopularMovies,  ...popularResponse.results ];

    notifyListeners();
  }

  Future<List<Cast>> getMovieCast( int movieId ) async {

    // verificamos que la pelicula este cargada en memoria
    // sino sale la peticion https
    if ( moviesCast.containsKey( movieId ) ) {
      return moviesCast[movieId]!;
    }

    print('solicitando info del servidor');

    // revisamos el mapa
    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson( jsonData );

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovies( String query ) async {
    Uri url = Uri.https( _baseUrl, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'query': query
    });

    final response = await http.get( url );
    final searchResponse = SearchResponse.fromJson( response.body );

    return searchResponse.results;
  }

  void getSuggestionsByQuery( String search ) {
    debouncer.value = '';
    debouncer.onValue = ( value ) async {
      final movies = await searchMovies( value );

      // ejecuta la salida de suggestions controller
      _suggestionsStreamController.add( movies );
    };

    final timer = Timer.periodic( const Duration( milliseconds: 300 ), (_) {
      debouncer.value = search;
    });

    Future.delayed(
        const Duration( milliseconds: 301 )
    ).then( (_) => timer.cancel() );
  }
}