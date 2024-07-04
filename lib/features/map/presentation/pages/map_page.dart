import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/core/utils/app_constants.dart';
import 'package:tourist_guide/core/utils/app_strings.dart';
import 'package:tourist_guide/features/home/presentation/functions/selected_city.dart';
import '../../../../core/widgets/custom_top_page_bar.dart';
import '../provider/map_provider.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/map_widget.dart';

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
              MyMapWidget(initialGovernorate: initialGovernorate),
              BottomMapPageBar(governorates: AppConstants.governorates),
            ],
          ),
        ),
      ),
    );
  }
}
