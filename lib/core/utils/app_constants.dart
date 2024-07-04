abstract class AppConstants {
  static Duration toastDuration = const Duration(seconds: 5);
  static Duration toastAnimationDuration = const Duration(seconds: 1);

  static Duration durationAnimatedContainerDrawer =
      const Duration(milliseconds: 100);

  static Duration durationHoverDrawer = const Duration(milliseconds: 200);

  static Duration animationDurationFast = const Duration(milliseconds: 100);
  static Duration animationDurationX1 = const Duration(milliseconds: 200);
  static Duration animationDurationX2 = const Duration(milliseconds: 400);
  static Duration animationDurationX3 = const Duration(milliseconds: 600);
  static Duration animationDurationX4 = const Duration(milliseconds: 800);
  static Duration animationDurationX6 = const Duration(milliseconds: 1200);
  static Duration animationDurationX7 = const Duration(milliseconds: 1400);
  static Duration animationDurationX8 = const Duration(milliseconds: 1600);
  static Duration animationDurationX9 = const Duration(milliseconds: 1800);
  static Duration animationDurationX10 = const Duration(milliseconds: 2000);

  static double tapBarHeight = 60;

  static List<Map<String, dynamic>> governorates = [
    {"name": "Damascus", "lat": 33.5138, "lng": 36.2765},
    {"name": "Aleppo", "lat": 36.2021, "lng": 37.1343},
    {"name": "Homs", "lat": 34.7308, "lng": 36.7131},
    {"name": "Latakia", "lat": 35.5179, "lng": 35.7860},
    {"name": "Tartus", "lat": 34.8951, "lng": 35.8866},
    {"name": "Hama", "lat": 35.1318, "lng": 36.7578},
    {"name": "Idlib", "lat": 35.9306, "lng": 36.6339},
    {"name": "Daraa", "lat": 32.6250, "lng": 36.1050},
    {"name": "Deir ez-Zor", "lat": 35.3333, "lng": 40.1500},
    {"name": "Raqqa", "lat": 35.9500, "lng": 39.0167},
    {"name": "Hasakah", "lat": 36.4833, "lng": 40.7500},
    {"name": "Quneitra", "lat": 33.1250, "lng": 35.8219},
    {"name": "As-Suwayda", "lat": 32.7157, "lng": 36.5663},
    {"name": "Rif Dimashq", "lat": 33.5000, "lng": 36.3000},
  ];
}
