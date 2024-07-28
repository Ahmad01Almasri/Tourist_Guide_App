import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tourist_guide/core/widgets/card_item.dart';
import 'package:tourist_guide/features/historical/data/models/historical_place_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/loading_shimmer.dart';

class HistoricalListWidget extends StatelessWidget {
  final List<HistoricalModel>? historical;
  final int? itemCount;
  final bool isLoading;
  const HistoricalListWidget({
    super.key,
    this.historical,
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
          itemCount: itemCount ?? historical!.length,
          itemBuilder: (context, index) {
            return CardItem(
              itemImage: historical![index].images!.elementAt(1),
              itemName: historical![index].placeName.toString(),
              itemRate: historical![index].averageRating!.toDouble(),
              itemDescription: historical![index].description.toString(),
              onTap: () {
                // Navigate to detail page or perform other actions
              },
            );
          },
          separatorBuilder: (context, index) => const Divider(thickness: 1),
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
