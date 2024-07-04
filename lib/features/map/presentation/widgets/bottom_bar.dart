import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../provider/map_provider.dart';

class BottomMapPageBar extends StatelessWidget {
  const BottomMapPageBar({
    super.key,
    required List<Map<String, dynamic>> governorates,
  }) : _governorates = governorates;

  final List<Map<String, dynamic>> _governorates;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _governorates.length,
        itemBuilder: (context, index) {
          final governorate = _governorates[index];
          return GestureDetector(
            onTap: () {
              final newCenter = LatLng(governorate['lat'], governorate['lng']);
              context.read<MapState>().zoomToGovernorate(newCenter);
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(governorate['name'],
                      style: AppTextStyles.poppinsBoldstyle18),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
