import 'package:go_router/go_router.dart';
import 'package:tourist_guide/core/functions/navigation.dart';
import 'package:tourist_guide/core/utils/app_route_string.dart';
import 'package:tourist_guide/core/widgets/card_item.dart';
import 'package:tourist_guide/features/historical/data/models/historical_place_model.dart';
import 'package:flutter/material.dart';

class HistoricalListWidget extends StatelessWidget {
  final List<HistoricalModel> historical;

  const HistoricalListWidget({
    Key? key,
    required this.historical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 497,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: historical.length,
        itemBuilder: (context, index) {
          return CardItem(
            itemImage: historical[index].images!.elementAt(1),
            itemName: historical[index].placeName.toString(),
            itemRate: historical[index].averageRating!.toDouble(),
            itemDescription: historical[index].description.toString(),
            onTap: () {
              context.push(
                AppNamePage.historical,
                extra: historical[index],
              );
            },
          );
        },
        separatorBuilder: (context, index) => Divider(thickness: 1),
      ),
    );
  }
}
