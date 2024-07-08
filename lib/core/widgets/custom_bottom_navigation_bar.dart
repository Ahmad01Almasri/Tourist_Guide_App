import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/features/favorite/presentation/pages/favorite.dart';
import 'package:tourist_guide/features/home/presentation/pages/city_selection.dart';
import 'package:tourist_guide/features/map/presentation/pages/map_page.dart';
import 'package:tourist_guide/features/notification/presentation/pages/notification.dart';
import 'package:tourist_guide/features/top10restaurant/presentation/pages/top_ten_restaurant.dart';
import 'package:tourist_guide/features/hotel/presentation/widgets/top_hotel.dart';

import '../../features/home/presentation/pages/home.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  // استبدل _currentIndex بمتغير ValueNotifier
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const MapPage(),
    const FavoritePage(),
    const NotificationsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        // يشترك في تغييرات القيمة داخل _currentIndexNotifier
        valueListenable: _currentIndexNotifier,
        builder: (BuildContext context, int currentIndex, Widget? child) {
          // استخدام currentIndex لتحديد الصفحة المعروضة
          return _widgetOptions.elementAt(currentIndex);
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(Icons.home_outlined),
          Icon(Icons.location_on_outlined),
          Icon(Icons.favorite_border_outlined),
          Icon(Icons.notifications_none_sharp),
        ],
        onTap: (int value) {
          // تحديث قيمة _currentIndexNotifier عند النقر
          _currentIndexNotifier.value = value;
        },
        // استخدام قيمة _currentIndexNotifier كقيمة ابتدائية
        index: _currentIndexNotifier.value,
        backgroundColor: AppColors.primaryColor,
        height: 59,
        color: AppColors.white,
      ),
    );
  }
}
