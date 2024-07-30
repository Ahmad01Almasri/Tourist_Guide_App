import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourist_guide/features/auth/presentation/pages/login.dart';
import 'package:tourist_guide/features/auth/presentation/pages/signup.dart';
import 'package:tourist_guide/features/historical/presentation/pages/historical_page.dart';
import 'package:tourist_guide/features/restaurant/presentation/pages/all_restaurants.dart';
import 'package:tourist_guide/features/home/presentation/pages/home.dart';
import 'package:tourist_guide/features/hotel/presentation/pages/all_hotel.dart';
import 'package:tourist_guide/features/notification/presentation/pages/notification.dart';
import 'package:tourist_guide/features/splash/presentation/views/splash_view.dart';
import '../../features/ai chat/presentation/pages/ai_page.dart';
import '../../features/ai chat/presentation/pages/chat.dart';
import '../../features/historical/data/models/historical_place_model.dart';
import '../../features/historical/presentation/pages/all_historical_page.dart';
import '../../features/historical/presentation/pages/top_Three_historical_page.dart';
import '../../features/home/presentation/pages/city_selection.dart';
import '../../features/hotel/data/models/hotel_model.dart';
import '../../features/hotel/presentation/pages/hotel.dart';
import '../../features/hotel/presentation/pages/top_three_hotel.dart';
import '../../features/map/presentation/pages/map_page.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';
import '../../features/restaurant/data/models/res_model.dart';
import '../../features/restaurant/presentation/pages/restaurant.dart';
import '../../features/restaurant/presentation/pages/top_three_restaurant.dart';
import '../../features/services/presentation/pages/services_page.dart';
import '../utils/app_route_string.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppNamePage.splashPage,
      // parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => GeminiPage(),
    ),
    GoRoute(
      path: AppNamePage.onBoardingPage,
      // parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: AppNamePage.signInPage,
      // parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppNamePage.topThreeHotel,
      // parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => TopThreeHotelPage(),
    ),
    GoRoute(
      path: AppNamePage.signUpPage,
      // parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const SignUpPage(),
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
      path: AppNamePage.geminiPage,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) => const GeminiPage(),
    ),
    GoRoute(
      path: AppNamePage.servicesScreen,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) => ServicesScreen(),
    ),
    GoRoute(
      path: AppNamePage.notification,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) => const NotificationsPage(),
    ),
    GoRoute(
      path: AppNamePage.allRestaurant,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) => const AllRestaurantPage(),
    ),
    GoRoute(
      path: AppNamePage.allHotel,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) => AllHotelPage(),
    ),
    GoRoute(
      path: AppNamePage.topThreeHistorical,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) => const TopThreeHistoricalPage(),
    ),
    GoRoute(
      path: AppNamePage.topThreeRestaurant,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) => const TopThreeRestaurantPage(),
    ),
    GoRoute(
      path: AppNamePage.allHistorical,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) => const AllHistoricalPage(),
    ),
    GoRoute(
      path: AppNamePage.historical,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) {
        final historical = state.extra as HistoricalModel;
        return HistoricalPage(historical: historical);
      },
    ),
    GoRoute(
      path: AppNamePage.map,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) => const MapPage(),
    ),
    GoRoute(
      path: AppNamePage.hotel,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) {
        final hotel = state.extra as HotelModel;
        return HotelPage(hotel: hotel);
      },
    ),
    GoRoute(
      path: AppNamePage.restaurant,
      // parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) {
        final restaurant = state.extra as RestaurantModel;
        return RestaurantPage(restaurant: restaurant);
      },
    ),
  ],
);
