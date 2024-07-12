import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../features/hotel/data/models/all_hotel_model.dart';
import '../../features/hotel/presentation/provider/favorite_provider.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'rating_stars.dart';

class CardItem extends StatelessWidget {
  final AllHotelModel item;
  void Function()? onTap;
  CardItem({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final isFavorite = favoriteProvider.isFavorite(item.itemName);

    return Expanded(
      child: InkWell(
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
                      image: AssetImage(item.itemImage),
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
                        item.itemName,
                        style: AppTextStyles.poppinsThinW6000style22,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        item.itemModern,
                        style: AppTextStyles.poppinsW500style16,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            item.itemRate.toString(),
                            style: AppTextStyles.poppinsW500style16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          MyRatingBarIndicator(
                              itemSize: 20, itemRate: item.itemRate),
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
                                item.itemLocation,
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
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      favoriteProvider.toggleFavorite(item.itemName);
                    },
                    icon: Icon(
                      color: isFavorite ? AppColors.red : AppColors.black,
                      size: 30,
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
