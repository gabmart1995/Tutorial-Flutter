import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class MoviesProvider extends ChangeNotifier {

  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '7ba08f3c510dceec4a5627b65563ee32';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    getNowPlayMovies();
  }

  getNowPlayMovies() async {
    Uri url = Uri.https( _baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    // ejecutamos la peticion
    final response = await http.get( url );
    final nowPlayingResponse = NowPlayingResponse.fromJson( response.body );

    onDisplayMovies = nowPlayingResponse.results;

    // disparamos la notificacion
    notifyListeners();
  }
}