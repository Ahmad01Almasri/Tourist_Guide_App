import 'package:flutter/material.dart';

import '../widgets/card_restaurant_item.dart';
import '../widgets/top_restaurant.dart';

class TopTenResturant extends StatelessWidget {
  const TopTenResturant({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const TopRestaurantScreen(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CardRestaurantItem(),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
