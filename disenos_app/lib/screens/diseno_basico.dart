import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Image(image: AssetImage('assets/landscapes.jpeg')),
          const Title(),
          const ButtonSection(),
          // description
          Container(
            margin: const EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
            child: const Text('It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).')
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( horizontal: 30, vertical: 10 ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Oeschinen Lake Camround',
                style:  TextStyle( fontWeight: FontWeight.bold )
              ),
              Text(
                'kandersteg, SwitzerLand',
                style: TextStyle( color: Colors.black ),
              )
            ],
          ),
          
          Expanded(child: Container()),

          const Icon( Icons.star, color: Colors.red ),
          const Text('41'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( vertical: 20, horizontal: 25 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          CustomButton( icon: Icons.phone, text: 'CALL' ),
          CustomButton( icon: Icons.send, text: 'ROUTE' ),
          CustomButton( icon: Icons.share, text: 'SHARED' ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomButton({
    super.key,
    required this.icon,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon( icon, color: Colors.cyan, size: 30 ),
        Text( text, style: const TextStyle( color: Colors.cyan ))
      ],
    );
  }
}