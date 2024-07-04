import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/core/utils/app_constants.dart';
import 'package:tourist_guide/core/utils/app_strings.dart';
import 'package:tourist_guide/features/home/presentation/functions/selected_city.dart';
import '../../../../core/widgets/custom_top_page_bar.dart';
import '../provider/map_provider.dart';
import '../widgets/bottom_bar.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final initialGovernorateName = getCityName();
    final initialGovernorate = AppConstants.governorates.firstWhere(
      (g) => g['name'] == initialGovernorateName,
      orElse: () => AppConstants.governorates.first,
    );

    return ChangeNotifierProvider(
      create: (_) => MapState(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const CustomTopPageBar(
                pageName: AppStrings.syriaMap,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Consumer<MapState>(
                      builder: (context, mapState, child) {
                        return FlutterMap(
                          mapController: mapState.mapController,
                          options: MapOptions(
                            initialCenter: LatLng(initialGovernorate['lat'],
                                initialGovernorate['lng']),
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
                    Positioned(
                      top: 10,
                      right: 10,
                      bottom: 10,
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Consumer<MapState>(
                          builder: (context, mapState, child) {
                            return Slider(
                              value: mapState.currentZoom,
                              min: 1.0,
                              max: 18.0,
                              onChanged: (zoom) {
                                mapState.onZoomChanged(zoom);
                              },
                              divisions: 17,
                              label:
                                  "Zoom: ${mapState.currentZoom.toStringAsFixed(1)}",
                              activeColor: AppColors.primaryColor,
                              inactiveColor: AppColors.black,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BottomMapPageBar(governorates: AppConstants.governorates),
            ],
          ),
        ),
      ),
    );
  }
}
