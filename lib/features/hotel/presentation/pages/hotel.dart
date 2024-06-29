import 'package:flutter/material.dart';

import '../../../../core/widgets/card_restaurant_hotel_item.dart';
import '../widgets/top_hotel.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const TopRestaurantOrHotelBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CardRestaurantOrHotelItem(),
                  ),
                ),
              ),
            ),
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
