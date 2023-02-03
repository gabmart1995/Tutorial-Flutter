import 'package:disenos_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material app',
      initialRoute: 'home_screen',
      routes: {
        'basic_design': ( _ ) => const BasicDesignScreen(),
        'scroll_screen': ( _ ) => const ScrollScreen(),
        'home_screen': ( _ ) => const HomeScreen(),
      }
    );
  }
}


void main() => runApp( const MyApp() );
