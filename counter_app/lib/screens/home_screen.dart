import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  
  const HomeScreen({Key? key }):
    super(key: key);

  @override
  Widget build(BuildContext context) {

    const TextStyle fontSizeCounter = TextStyle( fontSize: 30 );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        elevation: 10,
      ),

      body: Center(
        child: Column(

          // posicion del flexbox
          mainAxisAlignment: MainAxisAlignment.center,
          
          // childrens
          children: const <Widget> [
            Text(
              'Número de clicks', 
              style: fontSizeCounter 
            ),
            Text(
              '0', 
              style: fontSizeCounter
            )
          ],

        ),
      ), 

      // Boton Flotante
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon( Icons.add ),
      ),
      
    );
  }
}