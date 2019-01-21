class PinMarker {
  double latitude;
  double longtitude;

  PinMarker({this.latitude, this.longtitude});

  factory PinMarker.fromMap(Map<String, dynamic> map) {
    return PinMarker(latitude: map['latitude'], longtitude: map['longtitude']);
  }
}
