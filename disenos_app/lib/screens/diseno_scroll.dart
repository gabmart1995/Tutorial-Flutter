import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
  const ScrollScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    const boxDecoration = BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 0.5], // genera un efecto visual
            colors: [
              Color(0xff5ee8c5),
              Color(0xff30BAD6)
            ]
        )
    );

    return Scaffold(
      backgroundColor: const Color(0xff30BAD6),
      body: Container(
        decoration: boxDecoration,
        child: PageView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: const <Widget> [
            Page1(),
            Page2(),
          ]
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {

    /*
    * El Decoration Image permite crear imagenes
    * de fondo que se expanda en todo el dispositivo
    */
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff30BAD6), // color hexadecimal
        image: DecorationImage(
            image: AssetImage('assets/scroll-1.png'),
            fit: BoxFit.cover
        )
      ) ,
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: null,
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: Colors.white
    );

    // safe area protege el contenido de desborde
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox( height: 30 ),
          const Text('11°', style: textStyle ),
          const Text('Miércoles', style: textStyle ),
          Expanded(child: Container()),
          const Icon(
            Icons.keyboard_arrow_down,
            size: 100,
            color: Colors.white
          )
        ],
      ),
    );
  }

}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        // background image
        Background(),
        MainContent(),
      ],
    );
  }

}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      child:  Center(
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xff0098fa),
            shape: const StadiumBorder()
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Bienvenido',
              style: TextStyle( color: Colors.white, fontSize: 30 )
            ),
          ),
        ),
      ),
    );
  }
}