import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/rating_stars.dart';
import '../../../home/presentation/widgets/smooth_images_indicator.dart';
import '../../../map/presentation/widgets/slider_map.dart';
import '../widgets/comment_section.dart';
import '../widgets/description_section.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  _HotelPageState createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;
  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();
  List<String> images = ['image1', 'image2', 'image3']; // Example image list

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        if (_currentPage < images.length - 1) {
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
                    Text(
                      "New Mall",
                      style: AppTextStyles.poppinsBoldstyle24,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            3.7.toString(),
                            style: AppTextStyles.poppinsW500style16
                                .copyWith(fontSize: 18, color: AppColors.black),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const MyRatingBarIndicator(
                            itemSize: 25,
                            itemRate: 3.7,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.black,
                    ),
                    const DescriptionSection(),
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
                    // Map of Syria
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 300,
                        child: Stack(
                          children: [
                            FlutterMap(
                              options: const MapOptions(
                                initialCenter: LatLng(
                                    33.5138, 36.2765), // Coordinates for Syria
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
                                      point: const LatLng(33.5138, 36.2765),
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
