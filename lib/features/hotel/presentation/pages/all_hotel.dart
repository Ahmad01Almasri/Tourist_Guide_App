import 'package:flutter/material.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/card_item.dart';
import '../../../../core/widgets/top_all_item.dart';
import '../../data/models/all_hotel_model.dart';

class ALlHotelPage extends StatelessWidget {
  ALlHotelPage({super.key});
  final List<AllHotelModel> hotelList = [
    AllHotelModel(
        itemName: "Hotel A",
        isFavorite: true,
        itemModern: "Modern Style",
        itemRate: 4.5,
        itemLocation: "Location A",
        itemImage: "assets/images/images (1).jpg"),
    AllHotelModel(
        isFavorite: false,
        itemName: "Hotel B",
        itemModern: "Modern Style",
        itemRate: 4.5,
        itemLocation: "Location B",
        itemImage: "assets/images/images (1).jpg"),
    AllHotelModel(
        isFavorite: false,
        itemName: "Hotel C",
        itemModern: "Modern Style",
        itemRate: 3.6,
        itemLocation: "Location C",
        itemImage: "assets/images/images (1).jpg"),
    AllHotelModel(
        isFavorite: false,
        itemName: "Hotel D",
        itemModern: "Modern Style",
        itemRate: 2.5,
        itemLocation: "Location D",
        itemImage: "assets/images/images (1).jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const TopAllItemBar(
              topText: AppStrings.allHotelAvaliable,
            ),
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 15),
            //     child: ListView.builder(
            //       itemCount: hotelList.length,
            //       itemBuilder: (context, index) => Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child:
            //         //  CardItem(
            //         //   onTap: () {},
            //         //   item: hotelList[index],
            //         // ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
