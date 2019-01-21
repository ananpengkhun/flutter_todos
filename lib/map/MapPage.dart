import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:io';

import './../database/PinProvider.dart';
import './model/PinMarker.dart';

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapPageState();
  }
}

class _MapPageState extends State<MapPage>
    with AutomaticKeepAliveClientMixin<MapPage> {
  GoogleMapController _googleMapController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(13.799937, 100.54994), zoom: 17.0),
        onMapCreated: _onMapCreated);
  }

  _addMaker(LatLng a) {
    _googleMapController.addMarker(MarkerOptions(position: a));
  }

  _mapTab(LatLng a) {
    PinProvider.db.insertPin(a.latitude, a.longitude);
    _addMaker(a);
  }

  _onMapCreated(GoogleMapController g) {
    _googleMapController = g;

    PinProvider.db.queryPin().then((pin) {
      pin.forEach((f) {
        _googleMapController.addMarker(
            MarkerOptions(position: LatLng(f.latitude, f.longtitude)));
      });
    });

    _googleMapController.onMapTapped.add(_mapTab);
  }

  @override
  bool get wantKeepAlive => true;
}
