import 'package:flutter/material.dart';
import 'package:tourist_guide/core/functions/navigation.dart';
import 'package:tourist_guide/core/utils/app_route_string.dart';

class BottomNavigationModel extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    if (index == _selectedIndex) {
      return; // لا تفعل شيئًا إذا كان الفهرس هو نفسه
    }

    _selectedIndex = index;
    notifyListeners(); // إعلام المستمعين بتغيير الحالة
  }

  void navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        customNavigate(context, AppNamePage.homePage);
        break;
      case 1:
        customNavigate(context, AppNamePage.topTenRestaurant);
        break;
      case 2:
        customNavigate(context, AppNamePage.homePage);
        break;
      case 3:
        customNavigate(context, AppNamePage.citySelectionPage);
        break;
      default:
        break;
    }
  }
}
