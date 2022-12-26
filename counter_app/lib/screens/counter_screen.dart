import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  
  const CounterScreen({Key? key }):
    super(key: key);

  // manejo del estado del componente
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  
  int counter = 0;

  void increase() {

    counter++;

    setState(() {});
  }

  void decrease() {

    if ( counter <= 0 ) {
      return;
    }

    counter--;

    setState(() {});
  }

  void reset() {

    counter = 0;

    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {

    const TextStyle fontSizeCounter = TextStyle( fontSize: 30 );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        elevation: 10,
      ),

      body: Center(
        child: Column(

          // posicion del flexbox
          mainAxisAlignment: MainAxisAlignment.center,
          
          // childrens
          children: <Widget> [
            const Text(
              'Número de clicks', 
              style: fontSizeCounter 
            ),
            Text(
              '$counter', 
              style: fontSizeCounter
            )
          ],

        ),
      ), 

      // Boton Flotante
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActions( 
        increaseFunc: increase,
        decreaseFunc: decrease, 
        resetFunc: reset,
      ),
      
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  
  final Function increaseFunc, decreaseFunc, resetFunc;

  const CustomFloatingActions({
    Key? key, 
    required this.increaseFunc,
    required this.decreaseFunc,
    required this.resetFunc,
  }): 
    super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () => decreaseFunc(),
          child: const Icon( Icons.exposure_minus_1_outlined ),
        ),

        FloatingActionButton(
          onPressed: () => resetFunc(),
          child: const Icon( Icons.reset_tv ),
        ),

        FloatingActionButton(
          onPressed: () => increaseFunc(),
          child: const Icon( Icons.exposure_plus_1_outlined ),
        ),
      ],
    );

  }
}