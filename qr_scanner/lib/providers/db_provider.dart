import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';

import 'package:qr_scanner/model/scan_model.dart';
export 'package:qr_scanner/model/scan_model.dart';

import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  // contructor privado singleton
  DBProvider._();

  Future<Database> get database async {

    if ( _database != null ) {
      return _database!;
    }

    // creamos la instancia
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {

    // path file sqlLite
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentDirectory.path, 'ScansDB.db' );

    // print( path );

    return await openDatabase(
        path,
        version: 2,
        onCreate: ( Database db, _ ) async {
          await db.execute('''
            CREATE TABLE Scans(
              id INTEGER PRIMARY KEY,
              type TEXT,
              value TEXT
            );
            
            DELETE FROM Scans;
          ''');
        }
      );
  }

  Future<int> newScanRaw( ScanModel scan ) async {
    final db = await database;
    final id = scan.id;
    final type = scan.type;
    final value = scan.value;
    final response = await db.rawInsert('''
      INSERT INTO Scans( id, type, value )
        VALUES( $id, '$type', '$value' )
    ''');

    return response;
  }

  Future<int> newScan( ScanModel scan ) async {
    final db = await database;
    final response = await db.insert( 'Scans', scan.toJson() );

    // ID del ultimo registro insertado
    return response;
  }
  
  Future<ScanModel?> getScanById( int id ) async {
    final db = await database;
    final response = await db.query(
        'Scans',
        where: 'id = ?',
        whereArgs: [id]
    );

    return response.isEmpty
      ? null
      : ScanModel.fromJson( response.first );
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final response = await db.query('Scans');

    return response.isEmpty
      ? []
      : response.map(
          ( scan ) => ScanModel.fromJson( scan )
        ).toList();
  }

  Future<List<ScanModel>> getAllScansByType( String type ) async {
    final db = await database;
    final response = await db.query(
      'Scans',
      where: 'type = ?',
      whereArgs: [type]
    );

    return response.isEmpty
        ? []
        : response.map(
            ( scan ) => ScanModel.fromJson( scan )
    ).toList();
  }

  Future<int> updateScan( ScanModel scan ) async {
    final db = await database;
    final response = await db.update(
      'Scans',
      scan.toJson(),
      where: 'id = ?',
      whereArgs: [scan.id]
    );

    return response;
  }

  Future<int> deleteScan( int id ) async {
    final db = await database;
    final response = await db.delete(
        'Scans',
        where: 'id = ?',
        whereArgs: [id]
    );

    return response;
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    final response = await db.delete('Scans');

    return response;
  }
}