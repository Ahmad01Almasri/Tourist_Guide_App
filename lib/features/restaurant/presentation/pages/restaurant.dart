import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:tourist_guide/features/restaurant/data/models/res_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/comment_section.dart';
import '../../../../core/widgets/description_section.dart';
import '../../../../core/widgets/rating_stars.dart';
import '../../../home/presentation/widgets/smooth_images_indicator.dart';

class RestaurantPage extends StatefulWidget {
  final RestaurantModel restaurant;
  const RestaurantPage({super.key, required this.restaurant});

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;
  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        if (_currentPage < widget.restaurant.images!.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        // Ensure _currentPage is valid before using it
        if (_currentPage.isFinite && !_currentPage.isNaN) {
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        } else {
          print('Invalid _currentPage value: $_currentPage');
        }
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SmoothImagesIndicator(
                isImagesNetwork: true,
                images: widget.restaurant.images!.toList(),
                currentPage: _currentPage,
                pageController: _pageController,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        size: 40,
                        Icons.arrow_back,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      widget.restaurant.placeName.toString(),
                      style: AppTextStyles.poppinsBoldstyle24,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.restaurant.averageRating.toString(),
                            style: AppTextStyles.poppinsW500style16
                                .copyWith(fontSize: 18, color: AppColors.black),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          MyRatingBarIndicator(
                            itemSize: 25,
                            itemRate:
                                widget.restaurant.averageRating!.toDouble(),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.black,
                    ),
                    DescriptionSection(
                      description: widget.restaurant.description!.toString(),
                    ),
                    Divider(
                      color: AppColors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 240, top: 20),
                      child: Text(
                        AppStrings.location,
                        style: AppTextStyles.poppinsW500style16.copyWith(
                            fontSize: 20, color: AppColors.primaryColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 300,
                        child: Stack(
                          children: [
                            FlutterMap(
                              options: MapOptions(
                                initialCenter: LatLng(
                                  widget.restaurant.location!.lat!.toDouble(),
                                  widget.restaurant.location!.lng!.toDouble(),
                                ), // Coordinates for Syria
                                maxZoom: 18.0,
                                minZoom: 1.0,
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                                  userAgentPackageName: 'com.example.app',
                                ),
                                MarkerLayer(
                                  markers: [
                                    Marker(
                                      width: 80.0,
                                      height: 80.0,
                                      point: LatLng(
                                          widget.restaurant.location!.lat!
                                              .toDouble(),
                                          widget.restaurant.location!.lng!
                                              .toDouble()),
                                      child: Icon(
                                        Icons.location_on,
                                        color: AppColors.red,
                                        size: 40.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: AppColors.black,
                    ),
                    CommentSection(textController: textController),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
