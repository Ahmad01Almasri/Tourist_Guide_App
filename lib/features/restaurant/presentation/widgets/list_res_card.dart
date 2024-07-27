import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_route_string.dart';
import '../../../../core/widgets/card_item.dart';
import '../../data/models/res_model.dart';

class RestaurantListWidget extends StatelessWidget {
  final List<RestaurantModel> restaurant;
  final int? itemCount;
  const RestaurantListWidget({
    super.key,
    required this.restaurant,
    this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 497,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: itemCount ?? restaurant.length,
        itemBuilder: (context, index) {
          return CardItem(
            itemImage: restaurant[index].images!.elementAt(1),
            itemName: restaurant[index].placeName.toString(),
            itemRate: restaurant[index].averageRating!.toDouble(),
            itemDescription: restaurant[index].description.toString(),
            onTap: () {
              context.push(
                AppNamePage.restaurant,
                extra: restaurant[index],
              );
            },
          );
        },
        separatorBuilder: (context, index) => Divider(thickness: 1),
      ),
    );
  }
}
