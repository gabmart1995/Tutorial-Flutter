import 'package:flutter/material.dart';
import 'package:qr_scanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String typeSelected = 'http';

  newScan( String value ) async {
    final newScanModel = ScanModel( value:  value );
    final id = await DBProvider.db.newScan( newScanModel );

    // assign id to model
    newScanModel.id = id;

    // push the list and notify UI
    if ( typeSelected == newScanModel.type ) {
      scans.add( newScanModel );
      notifyListeners();
    }
  }

  loadScans() async {
    final scansModels = await DBProvider.db.getAllScans();
    scans = [...scansModels];
    notifyListeners();
  }

  loadScansByType( String type ) async {
    final scansModels = await DBProvider.db.getAllScansByType( type );
    scans = [...scansModels];

    // set typeSelected and notify UI
    typeSelected = type;
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }


  deleteScanById( int id ) async {
    await DBProvider.db.deleteScan( id );

    // load the array and notify UI
    loadScansByType(typeSelected);
  }
}