import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
   
  final options = const ['Megaman', 'MetalGear', 'SuperSmash', 'Final Fantasy'];

  const ListView2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: ( context, index ) => ListTile(
          title: Text( options[index] ),
          trailing: const Icon( 
            Icons.arrow_forward_ios_outlined, 
            color: Colors.indigo, 
          ),
          onTap: () {
            final game = options[index];
            print( game );            
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
      appBar: AppBar(
        title: const Text('ListView Tipo 2'),
      ),
    );
  }
}