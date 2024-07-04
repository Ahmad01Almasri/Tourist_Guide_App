import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../provider/map_provider.dart';

class SliderMap extends StatelessWidget {
  const SliderMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 10,
      bottom: 10,
      child: RotatedBox(
        quarterTurns: 3,
        child: Consumer<MapState>(
          builder: (context, mapState, child) {
            return SliderTheme(
              data: SliderThemeData(
                  valueIndicatorTextStyle: AppTextStyles.poppinsw600style14),
              child: Slider(
                overlayColor: MaterialStatePropertyAll(
                  AppColors.white,
                ),
                value: mapState.currentZoom,
                min: 1.0,
                max: 18.0,
                onChanged: (zoom) {
                  mapState.onZoomChanged(zoom);
                },
                divisions: 17,
                label: "Zoom: ${mapState.currentZoom.toStringAsFixed(1)}",
                activeColor: AppColors.primaryColor,
                inactiveColor: AppColors.black,
              ),
            );
          },
        ),
      ),
    );
  }
}
