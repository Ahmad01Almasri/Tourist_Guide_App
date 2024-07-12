import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/provider/p.dart';
import 'core/routes/app_router.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_colors.dart';
import 'core/services/shared_preferences_service.dart';
import 'core/utils/app_strings.dart';
import 'features/hotel/presentation/provider/favorite_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();
  await getIt<CacheHelper>().init();
  await SharedPreferencesService.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => BottomNavigationModel()),
      ChangeNotifierProvider(create: (context) => FavoriteProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.offWhite,
        fontFamily: AppStrings.appFont,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
