import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourist_guide/core/widgets/card_restaurant_hotel_item.dart';

import '../../../../core/utils/app_strings.dart';

import '../../../../core/widgets/custom_top_page_bar.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomTopPageBar(
              pageName: AppStrings.favorite,
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemBuilder: (context, index) =>
            //         // const CardRestaurantOrHotelItem(),
            //     itemCount: 4,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
