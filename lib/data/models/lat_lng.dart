class LatLng {
  const LatLng(this.lat, this.lng);

  final double lat;
  final double lng;

  @override
  String toString() => '[lat: $lat, lng: $lng]';
}
