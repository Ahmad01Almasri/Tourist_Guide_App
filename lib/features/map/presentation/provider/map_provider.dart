import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapState with ChangeNotifier {
  final MapController _mapController = MapController();
  LatLng _currentCenter = LatLng(0, 0);
  double _currentZoom = 10.0;

  MapController get mapController => _mapController;

  LatLng get currentCenter => _currentCenter;

  double get currentZoom => _currentZoom;

  void zoomToGovernorate(LatLng newCenter) {
    _currentCenter = newCenter;
    _mapController.move(_currentCenter, _currentZoom);
    notifyListeners();
  }

  void onZoomChanged(double zoom) {
    _currentZoom = zoom;
    _mapController.move(_currentCenter, zoom);
    notifyListeners();
  }

  void updateCenter(LatLng newCenter) {
    _currentCenter = newCenter;
    notifyListeners();
  }
}
