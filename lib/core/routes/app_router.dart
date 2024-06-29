import 'package:go_router/go_router.dart';
import 'package:tourist_guide/features/auth/presentation/pages/login.dart';
import 'package:tourist_guide/features/auth/presentation/pages/signup.dart';
import 'package:tourist_guide/features/food/presentation/pages/food.dart';
import 'package:tourist_guide/features/home/presentation/pages/home.dart';
import 'package:tourist_guide/features/hotel/presentation/pages/hotel.dart';
import 'package:tourist_guide/features/notification/presentation/pages/notification.dart';
import 'package:tourist_guide/features/top10restaurant/presentation/pages/top_ten_restaurant.dart';

import '../../features/home/presentation/pages/city_selection.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';
import '../utils/app_route_string.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppNamePage.splashPage,
      builder: (context, state) => const MyBottomNavigationBar(),
    ),
    GoRoute(
      path: AppNamePage.onBoardingPage,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: AppNamePage.signUpPage,
      builder: (context, state) => const SignUp(),
    ),
    GoRoute(
      path: AppNamePage.signInPage,
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: AppNamePage.citySelectionPage,
      builder: (context, state) => const CitySelectionPage(),
    ),
    GoRoute(
      path: AppNamePage.homePage,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppNamePage.topTenRestaurant,
      builder: (context, state) => const TopTenResturantPage(),
    ),
    GoRoute(
      path: AppNamePage.notification,
      builder: (context, state) => const NotificationsPage(),
    ),
    GoRoute(
      path: AppNamePage.food,
      builder: (context, state) => const FoodPage(),
    ),
    GoRoute(
      path: AppNamePage.hotel,
      builder: (context, state) => const HotelPage(),
    ),
  ],
);
