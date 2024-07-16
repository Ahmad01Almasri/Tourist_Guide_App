import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/routes/app_router.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_colors.dart';
import 'core/services/shared_preferences_service.dart';
import 'core/utils/app_strings.dart';
import 'features/hotel/presentation/provider/favorite_provider.dart';
import 'features/auth/presentation/bloc/user_bloc.dart';
import 'injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  await SharedPreferencesService.init();
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
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
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
