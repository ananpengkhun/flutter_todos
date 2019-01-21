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
    with AutomaticKeepAliveClientMixin<MapPage>, WidgetsBindingObserver {
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
            'CREATE TABLE Test (id INTEGER PRIMARY KEY, latitude DOUBLE, longtitude DOUBLE)');
      });
    } else {
      database = await openDatabase(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(13.799937, 100.54994), zoom: 17.0),
        onMapCreated: _onMapCreated);
  }

  Future<List<Map>> queryData() async {
    return await database.rawQuery('SELECT * FROM Test');
  }

  insertLatLng(LatLng a) async {
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Test(latitude, longtitude) VALUES(${a.latitude},${a.longitude})');
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

  _markerTapped(Marker marker) {
    print("_markerTapped_markerTapped_markerTapped");
    AlertDialog(
      actions: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text("OK"),
        ),
        FlatButton(
          child: Text("CLOSE"),
          onPressed: () {},
        )
      ],
      content: Card(
        child: Column(
          children: <Widget>[
            Text(marker.id),
          ],
        ),
      ),
    );
  }

  _onMapCreated(GoogleMapController g) {
    _googleMapController = g;

    queryData().then((t) {
      t.forEach((f) {
        _googleMapController.addMarker(
            MarkerOptions(position: LatLng(f['latitude'], f['longtitude'])));
      });
    });

    _googleMapController.onMapTapped.add(_mapTab);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      database.close();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  bool get wantKeepAlive => true;
}
