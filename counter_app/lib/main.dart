import 'package:flutter/material.dart';

import 'package:counter_app/screens/counter_screen.dart';

class MyApp extends StatelessWidget {
  
  // constructor de la clase
  const MyApp({ Key? key }):
    super( key: key );

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen()
    );
  }
}

// funcion que arranca la app
void main() {
  runApp( const MyApp() );
}
