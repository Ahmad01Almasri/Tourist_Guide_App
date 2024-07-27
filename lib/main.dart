import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tourist_guide/core/services/firebase_api.dart';
import 'package:tourist_guide/features/historical/presentation/blocs/historicals_bloc.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/routes/app_router.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_colors.dart';
import 'core/services/shared_preferences_service.dart';
import 'core/utils/app_strings.dart';
import 'features/hotel/presentation/bloc/hotel_bloc.dart';
import 'features/auth/presentation/bloc/user_bloc.dart';
import 'features/restaurant/presentation/bloc/restaurant_bloc.dart';
import 'injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  await SharedPreferencesService.init();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBikiO4fJlgDXASiOtdUL7hZkvj3a-M3iU",
      appId: "1:668392408280:android:cf5eb0832e48c9398f03ad",
      messagingSenderId: "668392408280",
      projectId: "notification-18e27",
    ),
  );
  FirebaseApi().initNotifications();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<UserBloc>()),
        BlocProvider(
            create: (_) => di.sl<HistoricalBloc>()
              ..add(const GetAllHistoricalsEvent("Aleppo"))),
        BlocProvider(
            create: (_) =>
                di.sl<HotelBloc>()..add(const GetAllHotelEvent("Aleppo"))),
        BlocProvider(
            create: (_) => di.sl<RestaurantBloc>()
              ..add(const GetAllRestaurantEvent("Aleppo"))),

        // ChangeNotifierProvider(create: (context) => FavoriteProvider()
        // )
        // ,
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.offWhite,
          fontFamily: AppStrings.appFont,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
