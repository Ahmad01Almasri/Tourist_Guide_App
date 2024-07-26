import 'package:flutter/material.dart';
import 'package:tourist_guide/core/widgets/top_all_item.dart';
import 'package:tourist_guide/features/top10restaurant/data/models/top_ten_restaurant.dart';

import '../../../../core/utils/app_strings.dart';

class TopTenResturantPage extends StatelessWidget {
  TopTenResturantPage({super.key});
  final List<TopTenRestaurantModel> restaurantList = [
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
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // TopAllItemBar(
            //   topText: AppStrings.topTenRestaurant,
            // ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                // child: ListView.builder(
                //   itemCount: restaurantList.length,
                //   itemBuilder: (context, index) => Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: CardRestaurantOrHotelItem(
                //       initialFavorite: restaurantList[index].isFavorite,
                //       itemImage: restaurantList[index].itemImage,
                //       itemLocation: restaurantList[index].itemLocation,
                //       itemModern: restaurantList[index].itemModern,
                //       itemName: restaurantList[index].itemName,
                //       itemRate: restaurantList[index].itemRate,
                //     ),
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
