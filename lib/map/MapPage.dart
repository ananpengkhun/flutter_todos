import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dart:io';

import './model/PinMarker.dart';

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapPageState();
  }
}

class _MapPageState extends State<MapPage>
    with AutomaticKeepAliveClientMixin<MapPage> {
  Future<SharedPreferences> _share = SharedPreferences.getInstance();
  GoogleMapController _googleMapController;
  Database database;

  @override
  void initState() {
    super.initState();
    if (database == null) {
      openDatabase22();
    }
  }

  openDatabase22() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    if (!await Directory(dirname(path)).exists()) {
      database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
            // When creating the db, create the table
            db.execute(
                'CREATE TABLE Test (id INTEGER PRIMARY KEY, latitude TEXT, longtitude TEXT)');
          });
    } else {
      database = await openDatabase(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: queryData(),
        builder: (context, AsyncSnapshot<List<Map>> snapshot) {
          if (snapshot.hasData) {
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(13.799937, 100.54994), zoom: 17.0),
              onMapCreated: (GoogleMapController g) {
                _googleMapController = g;
                snapshot.data.forEach((f) {
                  _googleMapController.addMarker(MarkerOptions(
                      position: LatLng(double.parse(f['latitude']),
                          double.parse(f['longtitude']))));
                });

                _googleMapController.onMapTapped.add(_mapTab);
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Future<List<Map>> queryData() async {
    return await database.rawQuery('SELECT * FROM Test');
  }

  insertLatLng(LatLng a) async {
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Test(latitude, longtitude) VALUES(${a.latitude},${a
              .longitude})');
      print('inserted1: $id1');
    });
  }

  _addMaker(LatLng a) {
    _googleMapController.addMarker(MarkerOptions(position: a));
  }

  _mapTab(LatLng a) {
    insertLatLng(a);
    _addMaker(a);
  }

  @override
  bool get wantKeepAlive => true;
}
