import 'package:flutter/material.dart';
import 'package:tourist_guide/features/top10restaurant/data/models/top_ten_restaurant.dart';

import '../../../../core/widgets/card_restaurant_hotel_item.dart';
import '../../../hotel/presentation/widgets/top_hotel.dart';

class TopTenResturantPage extends StatelessWidget {
  TopTenResturantPage({super.key});
  List<TopTenRestaurantModel> hotelList = [
    TopTenRestaurantModel(
      itemName: "itemName",
      isFavorite: true,
      itemModern: "itemModern",
      itemRate: 4.5,
      itemLocation: "itemLocation",
      itemImage: "assets/images/images (1).jpg",
    ),
    TopTenRestaurantModel(
        isFavorite: true,
        itemName: "bbbb",
        itemModern: "itemModern",
        itemRate: 4.5,
        itemLocation: "itemLocation",
        itemImage: "assets/images/images (1).jpg")
  ];
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
                    child: CardRestaurantOrHotelItem(
                      itemImage: hotelList[index].itemImage,
                      itemLocation: hotelList[index].itemLocation,
                      itemModern: hotelList[index].itemModern,
                      itemName: hotelList[index].itemName,
                      itemRate: hotelList[index].itemRate,
                    ),
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
