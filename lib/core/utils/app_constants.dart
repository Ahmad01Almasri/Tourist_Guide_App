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

  static List<Map<String, String>> appServices = [
    {
      'title': 'Wadiny',
      'description': 'Wadiny application for city transportation',
      'url': 'https://play.google.com/store/apps/details?id=com.waddini&hl=ar',
      'image': 'assets/images/Wadiny.PNG'
    },
    {
      'title': 'Yalla Go',
      'description': 'Yalla Go application for trips and transportation',
      'url': 'https://play.google.com/store/apps/developer?id=YallaGo&hl=ar',
      'image': 'assets/images/Yalla Go.PNG'
    },
    {
      'title': 'Maamoulati',
      'description': 'Maamoulati application for managing transactions',
      'url':
          'https://play.google.com/store/apps/details?id=com.maamoulati&hl=ar',
      'image': 'assets/images/Maamoulati.PNG'
    },
    {
      'title': 'BeOrder',
      'description': 'BeOrder application for ordering services',
      'url': 'https://play.google.com/store/apps/details?id=com.beorder&hl=ar',
      'image': 'assets/images/BeOrder.WEBP'
    },
    {
      'title': 'MTN Cash Syria',
      'description': 'MTN Cash application for mobile money services in Syria',
      'url':
          'https://play.google.com/store/apps/details?id=com.mtncash.syria&hl=ar',
      'image': 'assets/images/MTN Cash Syria.jpg'
    },
    {
      'title': 'Aqrab Eleik',
      'description': 'Aqrab Eleik application for nearby services',
      'url':
          'https://play.google.com/store/apps/details?id=com.aqrabeleik&hl=ar',
      'image': 'assets/images/Aqrab Eleik.JPG'
    },
    {
      'title': 'Al-Dhahabi',
      'description': 'Al-Dhahabi application for Syria Islamic Bank',
      'url':
          'https://play.google.com/store/apps/details?id=com.syriabank.aldhahabi&hl=ar',
      'image': 'assets/images/Al-Dhahabi.JPG'
    },
    {
      'title': 'BBSF',
      'description': 'BBSF application for Banque Bemo Saudi Fransi',
      'url':
          'https://play.google.com/store/apps/details?id=com.bbsf.bank&hl=ar',
      'image': 'assets/images/bbsf1.PNG'
    },
    {
      'title': 'Safra Bi Noqra',
      'description': 'Safra Bi Noqra application for quick bookings',
      'url':
          'https://play.google.com/store/apps/details?id=com.safrabinoqra&hl=ar',
      'image': 'assets/images/Safra Bi Noqra.JPG'
    },
    {
      'title': 'Al Baraka Bank Syria',
      'description': 'Al Baraka Bank application for banking services in Syria',
      'url':
          'https://play.google.com/store/apps/details?id=com.albaraka.bank.syria&hl=ar',
      'image': 'assets/images/BBSF.PNG'
    },
    {
      'title': 'Node MS',
      'description': 'Node MS application for managing services',
      'url': 'https://play.google.com/store/apps/details?id=com.nodems&hl=ar',
      'image': 'assets/images/Node MS.JPG'
    },
  ];
}
