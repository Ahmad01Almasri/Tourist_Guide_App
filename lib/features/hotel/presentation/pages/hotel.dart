import 'package:flutter/material.dart';

import '../../../../core/widgets/card_restaurant_hotel_item.dart';
import '../../data/models/hotel_model.dart';
import '../widgets/top_hotel.dart';

class HotelPage extends StatelessWidget {
  HotelPage({super.key});
  List<HotelModel> hotelList = [
    HotelModel(
        itemName: "itemName",
        isFavorite: true,
        itemModern: "itemModern",
        itemRate: 4.5,
        itemLocation: "itemLocation",
        itemImage: "assets/images/images (1).jpg"),
    HotelModel(
        isFavorite: false,
        itemName: "bbbb",
        itemModern: "itemModern",
        itemRate: 4.5,
        itemLocation: "itemLocation",
        itemImage: "assets/images/images (1).jpg"),
    HotelModel(
        isFavorite: false,
        itemName: "bbbb",
        itemModern: "itemModern",
        itemRate: 3.6,
        itemLocation: "itemLocation",
        itemImage: "assets/images/images (1).jpg"),
    HotelModel(
        isFavorite: false,
        itemName: "bbbb",
        itemModern: "itemModern",
        itemRate: 2.5,
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
                  itemCount: hotelList.length,
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
          ],
        ),
      ),
    );
  }
}
