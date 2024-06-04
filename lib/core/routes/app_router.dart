import 'package:go_router/go_router.dart';
import 'package:tourist_guide/features/auth/presentation/pages/login.dart';
import 'package:tourist_guide/features/auth/presentation/pages/signup.dart';
import 'package:tourist_guide/features/home/presentation/pages/home.dart';
import 'package:tourist_guide/features/splash/presentation/views/splash_view.dart';

import '../../features/home/presentation/pages/city_selection.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';
import '../utils/app_route_string.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppPage.splashPage,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppPage.onBoardingPage,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: AppPage.signUpPage,
      builder: (context, state) => const SignUp(),
    ),
    GoRoute(
      path: AppPage.signIn,
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: AppPage.citySelectionPage,
      builder: (context, state) => const CitySelectionPage(),
    ),
    GoRoute(
      path: AppPage.homePage,
      builder: (context, state) => const HomePage(),
    )

    // GoRoute(
    //   path: "/homeNavBar",
    //   builder: (context, state) => const HomeNavBarWidget(),
    // ),
    // GoRoute(
    //   path: "/historicalPeriodsDetailsView",
    //   builder: (context, state) => HistoricalPeriodsDetailsView(
    //       model: state.extra as HistoricalPeriodsModel),
    // ),
  ],
);
