import 'package:go_router/go_router.dart';
import 'package:tourist_guide/features/auth/presentation/pages/login.dart';
import 'package:tourist_guide/features/auth/presentation/pages/signup.dart';
import 'package:tourist_guide/features/splash/presentation/views/splash_view.dart';

import '../../features/home/presentation/pages/city_selection.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const CitySelectionPage(),
    ),
    GoRoute(
      path: "/onBoarding",
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: "/signUp",
      builder: (context, state) => const SignUp(),
    ),
    GoRoute(
      path: "/signIn",
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: "/citySelection",
      builder: (context, state) => const CitySelectionPage(),
    ),
    // GoRoute(
    //   path: "/forgotPassword",
    //   builder: (context, state) => BlocProvider(
    //     create: (context) => AuthCubit(),
    //     child: const ForgotPasswordView(),
    //   ),
    // ),
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
