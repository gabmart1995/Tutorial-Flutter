import 'dart:math' show Random;

import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  // propiedades privadas
  double _width = 50;
  double _height = 50;
  Color _color = AppTheme.primary;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular( 10 );

  void onChangeShape() {

    final random = Random();

    _width = random.nextInt( 300 ).toDouble() + 70;
    _height = random.nextInt( 300 ).toDouble() + 70;
    _color = Color.fromRGBO(
        random.nextInt( 255 ), // red
        random.nextInt( 255 ), // green
        random.nextInt( 255 ), // blue
        1
    );
    _borderRadius = BorderRadius.circular(
        random.nextInt(100).toDouble() + 10
    );

    // actualiza el estado y vuelve a dibujar
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated container')
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.easeOutCubic,
          duration: const Duration( milliseconds: 400 ),
          height: _height,
          width: _width,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onChangeShape,
        child: const Icon( Icons.play_circle_outline, size: 35 ),
      ),
    );
  }
}