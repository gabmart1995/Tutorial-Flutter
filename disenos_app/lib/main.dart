import 'package:disenos_app/screens/screens.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material app',
      initialRoute: 'scroll_screen',
      routes: {
        'basic_design': ( _ ) => const BasicDesignScreen(),
        'scroll_screen': ( _ ) => const ScrollScreen(),
      }
    );
  }
}


void main() => runApp( const MyApp() );
