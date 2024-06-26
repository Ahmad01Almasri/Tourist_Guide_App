import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/provider/p.dart';
import 'core/routes/app_router.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_colors.dart';
import 'core/services/shared_preferences_service.dart';
import 'core/utils/app_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();
  await getIt<CacheHelper>().init();
  await SharedPreferencesService.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => BottomNavigationModel(),
      child: const MyApp(),
    ),
  );
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
