import 'package:flutter/material.dart';

import 'package:fl_components/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
        children: const [
          CustomCardType1(),
          SizedBox( height: 20 ),
          CustomCardType2(
              name: 'Un hermoso paisaje',
              imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.jhCwNq3cRglUXe55WwOlTAHaEK%26pid%3DApi&f=1&ipt=5b0205ebfedb3d6ab114bffafb49fa7681858de164f1d794dfd8b570f3522627&ipo=images',
          ),
          SizedBox( height: 20 ),
          CustomCardType2(
            imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.CjOxvyrTfddh1oimm7BRBQHaEo%26pid%3DApi&f=1&ipt=b3179646b896874f8c88bfbd981b4ee39115f8350cea7fd6f742e02afcaae913&ipo=images',
          ),
          SizedBox( height: 20 ),
          CustomCardType2(
            imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.FU6LkKuTSm9sJfek6avBJwHaEo%26pid%3DApi&f=1&ipt=7fc1713f221af6d70f6d48893c10d6030fa1757ceec54c04b70caa9e87bb8563&ipo=images',
            name: 'Alaska',
          ),
        ],
      ),
    );
  }
}
