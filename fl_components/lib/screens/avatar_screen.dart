import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {

  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatars'),
        actions: [
          Container(
            margin: const EdgeInsets.only( right: 5 ),
            child: CircleAvatar(
              backgroundColor: Colors.indigo[900],
              child: const Text('SL'),
            ),
          )
        ],
      ),
      body: const Center(
        child: CircleAvatar(
          maxRadius: 110,
          backgroundImage: NetworkImage('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmk0movieguide99l7786.kinstacdn.com%2Fwp-content%2Fuploads%2F2015%2F05%2Fstan-lee-0.jpg&f=1&nofb=1&ipt=2ce907e17d399ab2c8ceb07cec190c7b2424df7300ffb5c6d56d2f874da14d3d&ipo=images'),
        ),
      ),
    );
  }

}