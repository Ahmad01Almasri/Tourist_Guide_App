import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/core/functions/navigation.dart';
import 'package:tourist_guide/core/utils/app_route_string.dart';
import 'package:tourist_guide/core/widgets/card_item.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_top_page_bar.dart';
import '../../../hotel/data/models/all_hotel_model.dart';
import '../../../hotel/presentation/provider/favorite_provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    List<AllHotelModel> allHotels = [
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

    List<AllHotelModel> favoriteHotels =
        favoriteProvider.getFavoriteHotels(allHotels);

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomTopPageBar(
              pageName: AppStrings.favorite,
            ),
            Expanded(
              child: favoriteHotels.isEmpty
                  ? const Center(
                      child: Text(
                        "No favorite hotels found.",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CardItem(
                          onTap: () {
                            customNavigate(
                                context, AppNamePage.citySelectionPage);
                          },
                          item: favoriteHotels[index],
                        ),
                      ),
                      itemCount: favoriteHotels.length,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
