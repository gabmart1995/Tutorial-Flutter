import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  double _slideValue = 100;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders & Checks'),
      ),
      body: Column(
        children: [
          Slider.adaptive(
            min: 50,
            max: 400,
            value: _slideValue,
            activeColor: AppTheme.primary,
            onChanged: _sliderEnabled ? ( value ) {
              // print(value);
              _slideValue = value;
              setState(() {});
            } : null,
          ),

          /*Checkbox(
            activeColor: AppTheme.primary,
            value: _sliderEnabled,
            onChanged: ( value ) {
              _sliderEnabled = value ?? true;
              setState(() {});
            },
          ),*/
          
          CheckboxListTile(
            title: const Text('Habiltar Slider'),
            activeColor: AppTheme.primary,
            value: _sliderEnabled,
            onChanged: ( value ) {
              _sliderEnabled = value ?? true;
              setState(() {});
            },
          ),
          
          /*Switch(
            activeColor: AppTheme.primary,
            value: _sliderEnabled,
            onChanged: ( value ) {
              _sliderEnabled = value;
              setState(() {});
            }
          ),*/

          SwitchListTile.adaptive(
            title: const Text('Habiltar Slider'),
            activeColor: AppTheme.primary,
            value: _sliderEnabled,
            onChanged: ( value ) {
              _sliderEnabled = value;
              setState(() {});
            }
          ),

          const AboutListTile(),

          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.rqzG0X01lZobojJr1kjRPgHaI9%26pid%3DApi&f=1&ipt=040cfaff487f73cd7d7d27164a9e093f2d45e9a7349d8e34443f138456c71ebc&ipo=images'),
                fit: BoxFit.contain,
                width: _slideValue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}