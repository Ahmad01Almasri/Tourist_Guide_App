import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_route_string.dart';
import '../../../../core/widgets/card_item.dart';
import '../../data/models/hotel_model.dart';

class HotelListWidget extends StatelessWidget {
  final List<HotelModel> hotel;
  final int? itemCount;
  const HotelListWidget({
    Key? key,
    required this.hotel,
    this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 497,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: itemCount ?? hotel.length,
        itemBuilder: (context, index) {
          return CardItem(
            itemImage: hotel[index].images!.elementAt(1),
            itemName: hotel[index].placeName.toString(),
            itemRate: hotel[index].averageRating!.toDouble(),
            itemDescription: hotel[index].description.toString(),
            onTap: () {
              context.push(
                AppNamePage.hotel,
                extra: hotel[index],
              );
            },
          );
        },
        separatorBuilder: (context, index) => Divider(thickness: 1),
      ),
    );
  }
}
