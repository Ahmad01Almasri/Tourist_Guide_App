import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import '../provider/map_provider.dart';
import 'slider_map.dart';

class MyMapWidget extends StatelessWidget {
  const MyMapWidget({
    super.key,
    required this.initialGovernorate,
  });

  final Map<String, dynamic> initialGovernorate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Consumer<MapState>(
            builder: (context, mapState, child) {
              return FlutterMap(
                mapController: mapState.mapController,
                options: MapOptions(
                  initialCenter: LatLng(
                      initialGovernorate['lat'], initialGovernorate['lng']),
                  maxZoom: 18.0,
                  minZoom: 1.0,
                  onPositionChanged: (position, hasGesture) {
                    mapState.updateCenter(
                        position.center); // No need to check for null
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: const ['a', 'b', 'c'],
                    userAgentPackageName: 'com.example.app',
                  ),
                ],
              );
            },
          ),
          const SliderMap(),
        ],
      ),
    );
  }
}
