import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/directions_page.dart';
import 'package:qr_scanner/pages/map_page.dart';
import 'package:qr_scanner/pages/maps_page.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

import 'package:qr_scanner/providers/ui_provider.dart';
import 'package:qr_scanner/providers/db_provider.dart';

import 'package:qr_scanner/widgets/custom_navigation_bar.dart';
import 'package:qr_scanner/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(
            icon: const Icon( Icons.delete_forever ),
            onPressed: () {
              final scanListProvider = Provider.of<ScanListProvider>(
                context,
                listen: false
              );

              // delete all scans
              scanListProvider.deleteAll();
            },
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final currentIndex = (Provider.of<UIProvider>(context)).selectedOption;

    // use scan list provider
    final scanListProvider = Provider.of<ScanListProvider>(
        context,
        listen: false
    );

    switch ( currentIndex ) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return const MapsPage();

      case 1:
        scanListProvider.loadScansByType('http');
        return const DirectionsPage();

      default:
        return const MapsPage();
    }
  }
}

