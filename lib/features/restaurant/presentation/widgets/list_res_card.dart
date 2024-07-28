import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_route_string.dart';
import '../../../../core/widgets/card_item.dart';
import '../../data/models/res_model.dart';

class RestaurantListWidget extends StatelessWidget {
  final List<RestaurantModel>? restaurant;
  final int? itemCount;
  final bool isLoading;
  const RestaurantListWidget({
    super.key,
    this.restaurant,
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
          itemCount: itemCount ?? restaurant!.length,
          itemBuilder: (context, index) {
            return CardItem(
              itemImage: restaurant![index].images!.elementAt(1),
              itemName: restaurant![index].placeName.toString(),
              itemRate: restaurant![index].averageRating!.toDouble(),
              itemDescription: restaurant![index].description.toString(),
              onTap: () {
                context.push(
                  AppNamePage.restaurant,
                  extra: restaurant![index],
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
