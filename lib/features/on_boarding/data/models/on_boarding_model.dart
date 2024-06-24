import '../../../../core/utils/app_assets.dart';

class OnBoardingModel {
  final String imagePath;
  final String title;
  final String subTitle;

  OnBoardingModel({
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });
}

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
    imagePath: AppAssets.imagesOnBoarding,
    title: "Start Your Traveling Journey Safely & Fun",
    subTitle:
        "Using our application, you can find many geographical and historical places in Syria ",
  ),
  OnBoardingModel(
    imagePath: AppAssets.imagesOnBoarding2,
    title: "From every place in Syria",
    subTitle: "A large variety of ancient places from all over Syria",
  ),
  OnBoardingModel(
    imagePath: AppAssets.imagesOnBoarding1,
    title: "Using modern AI technology for better user experience",
    subTitle:
        "AI provide recommendations and helps you to continue the search journey",
  ),
];
