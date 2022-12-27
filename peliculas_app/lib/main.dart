import 'package:flutter/material.dart';
import 'package:peliculas_app/screens/screens.dart';

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

void main() => runApp( const MovieApp() );
