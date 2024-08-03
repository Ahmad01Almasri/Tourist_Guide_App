import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:tourist_guide/core/functions/navigation.dart';
import 'package:tourist_guide/core/utils/app_route_string.dart';
import 'package:tourist_guide/features/comment/presentation/pages/comment_page.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/comment_section.dart';
import '../../../../core/widgets/description_section.dart';
import '../../../../core/widgets/rating_stars.dart';
import '../../../home/presentation/widgets/smooth_images_indicator.dart';
import '../../data/models/historical_place_model.dart';

class HistoricalPage extends StatefulWidget {
  final HistoricalModel historical;
  const HistoricalPage({super.key, required this.historical});

  @override
  _HistoricalPageState createState() => _HistoricalPageState();
}

class _HistoricalPageState extends State<HistoricalPage> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;
  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();
  // List<String> images = ['image1', 'image2', 'image3']; // Example image list

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        if (_currentPage < widget.historical.images!.length - 1) {
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
                images: widget.historical.images!.toList(),
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
                      widget.historical.placeName.toString(),
                      style: AppTextStyles.poppinsBoldstyle24,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.historical.averageRating.toString(),
                            style: AppTextStyles.poppinsW500style16
                                .copyWith(fontSize: 18, color: AppColors.black),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          MyRatingBarIndicator(
                            itemSize: 25,
                            itemRate:
                                widget.historical.averageRating!.toDouble(),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.black,
                    ),
                    DescriptionSection(
                      description: widget.historical.description!.toString(),
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
                                  widget.historical.location!.lat!.toDouble(),
                                  widget.historical.location!.lng!.toDouble(),
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
                                          widget.historical.location!.lat!
                                              .toDouble(),
                                          widget.historical.location!.lng!
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
                    CommentSection(
                      textController: textController,
                    ),
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
