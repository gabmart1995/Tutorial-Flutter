import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
   
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIOS( BuildContext context  ) {

    showCupertinoDialog(
        barrierDismissible: false,
        context: context,
        builder: ( context ) {
          return CupertinoAlertDialog(
            title: const Text('My Alert'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Content alert'),
                SizedBox( height: 10 ),
                FlutterLogo( size: 100 )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop( context ),
                  child: const Text('Cancel')
              ),
              TextButton(
                  onPressed: () => Navigator.pop( context ),
                  child: const Text('Ok')
              )
            ],
          );
        }
    );
  }

  void displayDialogAndroid( BuildContext context ) {

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: ( context ) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular( 10 )
            ),
            elevation: 5,
            title: const Text('My Alert'),
            content:  Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Content alert'),
                SizedBox( height: 10 ),
                FlutterLogo( size: 100 )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop( context ),
                  child: const Text('Cancel')
              ),
              TextButton(
                  onPressed: () => Navigator.pop( context ),
                  child: const Text('Ok')
              )
            ],
          );
        }
    );
  }

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      body: Center(
         child: ElevatedButton(
            // codigo basado en la plataforma
             onPressed: () => Platform.isAndroid ? 
                displayDialogAndroid( context ) :
                displayDialogIOS( context ),
             child: const Padding(
               padding: EdgeInsets.all( 20 ),
               child: Text(
                 'Mostrar alerta',
                 style: TextStyle( fontSize: 20 ),
               ),
             )
         ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop( context ),
        child: const Icon( Icons.close ),
      ),
    );
  }
}