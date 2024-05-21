import 'package:flutter/material.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/core/utils/app_text_styles.dart';
import 'package:tourist_guide/extensions/widget_extensions.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_padding.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  int? tryAgainCount;
  AnimationController? _controller;
  Animation<Offset>? _carAnimation;
  Animation<double>? _fadeAnimation;

  @override
  void initState() {
    super.initState();

    tryAgainCount = 3;

    _controller = AnimationController(
      vsync: this,
      duration:
          AppConstants.animationDurationX4 * 2, // زيادة مدة الرسوم المتحركة
    );

    _carAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(-1, 0))
        .animate(_controller!);

    _fadeAnimation = Tween<double>(begin: 1, end: 0).animate(_controller!);

    // تأجيل التنقل إلى ما بعد اكتمال البناء الأولي
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
          const Duration(seconds: 2)); // تأخير إضافي لعرض الشعار
      bool isOnBoardingVisited =
          getIt<CacheHelper>().getData(key: "isOnBoardingVisited") ?? false;
      if (isOnBoardingVisited) {
        customReplacementNavigate(context, "/signUp");
      } else {
        customReplacementNavigate(context, "/onBoarding");
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _navigateAfterDelay();
  }

  Future<void> _navigateAfterDelay() async {
    await Future.delayed(AppConstants.animationDurationX6);
    if (mounted) {
      // تحقق إذا كان الويدجت لا يزال في الشجرة
      await _controller?.forward();
      await Future.delayed(
          const Duration(seconds: 1)); // تأخير بعد اكتمال الرسوم المتحركة
      // if (SharedPreferencesService.isAuth()) {
      //   Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(builder: (context) => const Login()));
      // } else {
      //   Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(builder: (context) => const OnBoardingView()));
      // }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: FadeTransition(
        opacity: _fadeAnimation!,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _carAnimation!,
                child: Center(
                    child: Column(
                  children: [
                    Image.asset(
                        "assets/images/IMG_20240520_185909_833-removebg-preview.png",
                        height: 200),
                    Text(AppStrings.appName,
                        style: AppTextStyles.poppins600style64),
                  ],
                )),
              ),
            ],
          ).wrapPadding(AppPadding.pagePadding),
        ),
      ),
    );
  }
}
