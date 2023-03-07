import 'package:flutter/material.dart';
import 'package:qr_scanner/widgets/scan_tiles.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanTiles( type: 'geo' );
  }
}