import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapPageState();
  }
}

class _MapPageState extends State<MapPage> with AutomaticKeepAliveClientMixin<MapPage>{
  GoogleMapController _googleMapController;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
      onMapCreated: _onMapCreated,
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _googleMapController = controller;

      _googleMapController.onMapTapped.add(_mapTab);
    });
  }

  _mapTab(LatLng a) {
    _googleMapController.addMarker(MarkerOptions(position: a));
  }

  @override
  bool get wantKeepAlive => true;
}
