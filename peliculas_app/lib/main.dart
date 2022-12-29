import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';
import 'package:peliculas_app/screens/screens.dart';

class AppState extends StatelessWidget {
  const AppState({ Key? key }):
        super( key: key );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ( _ ) => MoviesProvider(),
          lazy: false
        ),
      ],
      // Application
      child: const MovieApp(),
    );
  }
}


class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      initialRoute: 'home',
      routes: {
        'home': ( _ ) => const HomeScreen(),
        'details': ( _ ) => const DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.indigo
        )
      ),
    );
  }
}

void main() => runApp( const AppState() );
