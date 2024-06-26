import 'package:flutter/material.dart';

import '../widgets/card_restaurant_item.dart';
import '../widgets/top_restaurant.dart';

class TopTenResturantPage extends StatelessWidget {
  const TopTenResturantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const TopRestaurantBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CardRestaurantItem(),
                  ),
                ),
              ),
            ),
            // Add more widgets here below TopRestaurantPage
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Add more widgets here',
                style: TextStyle(fontSize: 18.0, color: Colors.black12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
