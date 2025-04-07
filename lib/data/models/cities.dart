import 'package:open_weather/data/models/lat_lng.dart';

enum Cities {
  joinville('Joinville / SC', LatLng(-26.305162655275687, -48.849284033529365)),
  sanFrancisco('San Francisco / CA', LatLng(37.77338020005381, -122.41950030491161)),
  urubici('Urubici / SC', LatLng(-28.014876477645924, -49.594066950649975));

  final String name;
  final LatLng latLng;

  const Cities(this.name, this.latLng);
}
