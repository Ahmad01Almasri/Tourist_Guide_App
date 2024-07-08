import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourist_guide/features/auth/presentation/pages/login.dart';
import 'package:tourist_guide/features/auth/presentation/pages/signup.dart';
import 'package:tourist_guide/features/food/presentation/pages/food.dart';
import 'package:tourist_guide/features/home/presentation/pages/home.dart';
import 'package:tourist_guide/features/hotel/presentation/pages/hotel.dart';
import 'package:tourist_guide/features/notification/presentation/pages/notification.dart';
import 'package:tourist_guide/features/splash/presentation/views/splash_view.dart';
import 'package:tourist_guide/features/top10restaurant/presentation/pages/top_ten_restaurant.dart';

import '../../features/favorite/presentation/pages/favorite.dart';
import '../../features/home/presentation/pages/city_selection.dart';
import '../../features/map/presentation/pages/map_page.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';
import '../utils/app_route_string.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppNamePage.splashPage,
      // parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => HotelPage(),
    ),
    GoRoute(
      path: AppNamePage.onBoardingPage,
      // parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: AppNamePage.signUpPage,
      // parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const SignUp(),
    ),
    GoRoute(
      path: AppNamePage.signInPage,
      // parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: AppNamePage.citySelectionPage,
      // parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const CitySelectionPage(),
    ),
    GoRoute(
      path: AppNamePage.myBottomNavigationBar,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) => const MyBottomNavigationBar(),
    ),
    GoRoute(
      path: AppNamePage.homePage,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppNamePage.topTenRestaurant,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) => TopTenResturantPage(),
    ),
    GoRoute(
      path: AppNamePage.notification,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) => const NotificationsPage(),
    ),
    GoRoute(
      path: AppNamePage.food,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) => const FoodPage(),
    ),
    GoRoute(
      path: AppNamePage.hotel,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) => HotelPage(),
    ),
    GoRoute(
      path: AppNamePage.map,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) => const MapPage(),
    ),
    GoRoute(
      path: AppNamePage.favorite,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) => const FavoritePage(),
    ),
  ],
);
