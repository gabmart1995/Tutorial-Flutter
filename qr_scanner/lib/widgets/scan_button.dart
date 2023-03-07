import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        final barcodeScanRes = 'https://gabmart1995.github.io';

        /*String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3b8bef',
            'Cancel',
            false,
            ScanMode.QR
        );*/

        final scanListProvider = Provider.of<ScanListProvider>(
          context,
          listen: false
        );
        
        scanListProvider.newScan( barcodeScanRes );
        scanListProvider.newScan('geo:15.22,15.66');
      },
    );
  }
}