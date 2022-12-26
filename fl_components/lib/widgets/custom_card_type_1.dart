import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            title: Text('My title'),
            subtitle: Text('Lorem Ipsum'),
            leading:
            Icon(
                Icons.photo_album_outlined,
                color: AppTheme.primary
            ),
          ),
          Padding(
            padding: const EdgeInsets.only( right: 5 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom( foregroundColor: Colors.indigo ),
                    child: const Text('Cancel'),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text('Ok')
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}