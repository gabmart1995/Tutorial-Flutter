import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
   
  final options = const ['Megaman', 'MetalGear', 'SuperSmash', 'Final Fantasy'];

  const ListView1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: ListView(
        children: <Widget>[
          
          // mapeamos las opciones a un widget
          ...options.map(
            ( option ) => ListTile( 
              title: Text(option),
              trailing: const Icon( Icons.arrow_forward_ios_outlined ), 
            )
          ).toList(),

        ],
      ),
      appBar: AppBar(
        title: const Text('ListView Tipo 1'),
      ),
    );
  }
}