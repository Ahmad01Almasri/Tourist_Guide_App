import 'package:flutter/material.dart';
import 'package:tourist_guide/features/home/presentation/functions/selected_city.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'rating_stars.dart';

class CardItem extends StatelessWidget {
  void Function()? onTap;
  final String itemImage;
  final String itemName;
  final String itemDescription;
  final double itemRate;
  CardItem({
    super.key,
    required this.onTap,
    required this.itemImage,
    required this.itemName,
    required this.itemDescription,
    required this.itemRate,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 135,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(itemImage),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName,
                      style: AppTextStyles.poppinsThinW6000style22,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      itemDescription,
                      style: AppTextStyles.poppinsW500style16,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          itemRate.toString(),
                          style: AppTextStyles.poppinsW500style16,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        MyRatingBarIndicator(itemSize: 20, itemRate: itemRate),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.black38,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              getCityName(),
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              style: AppTextStyles.poppinsW500style16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Column(
            //   children: [
            //     IconButton(
            //       onPressed: () {
            //         favoriteProvider.toggleFavorite(item.itemName);
            //       },
            //       icon: Icon(
            //         color: isFavorite ? AppColors.red : AppColors.black,
            //         size: 30,
            //         isFavorite
            //             ? Icons.favorite
            //             : Icons.favorite_border_outlined,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
