import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/functions/save_place_id.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_route_string.dart';
import '../../../../core/widgets/card_item.dart';
import '../../data/models/hotel_model.dart';

class HotelListWidget extends StatelessWidget {
  final List<HotelModel>? hotel;
  final int? itemCount;
  final bool isLoading;
  const HotelListWidget({
    super.key,
    this.hotel,
    this.itemCount,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return buildShimmerLoading();
    } else {
      return SizedBox(
        height: 497,
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: itemCount ?? hotel!.length,
          itemBuilder: (context, index) {
            return CardItem(
              itemImage: hotel![index].images!.elementAt(1),
              itemName: hotel![index].placeName.toString(),
              itemRate: hotel![index].averageRating!.toDouble(),
              itemDescription: hotel![index].description.toString(),
              onTap: () {
                savePlaceId(hotel![index].placeId.toString());
                context.push(
                  AppNamePage.hotel,
                  extra: hotel![index],
                );
              },
            );
          },
          separatorBuilder: (context, index) => Divider(thickness: 1),
        ),
      );
    }
  }

  Widget buildShimmerLoading() {
    return SizedBox(
      height: 497,
      child: ListView.builder(
        itemCount: itemCount ?? 5, // Number of shimmer cards to show
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Shimmer.fromColors(
              baseColor: AppColors.black38,
              highlightColor: AppColors.offWhite,
              child: Card(
                child: Container(
                  height: 100.0,
                  width: double.infinity,
                  color: AppColors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
