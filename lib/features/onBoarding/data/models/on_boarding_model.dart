import 'package:dalel/core/utils/assets.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String description;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.description,
  });


}

  List<OnBoardingModel> onboardingData = [
    OnBoardingModel(
      image: MyAppAssets.assetsImagesFrame1,
      title: 'Explore The history with Dalel in a smart way',
      description:
          'Using our app’s history libraries you can find many historical periods',
    ),
    OnBoardingModel(
      image: MyAppAssets.assetsImagesFrame2,
      title: 'From every place on earth',
      description:
          'A big variety of ancient places from all over the world',
    ),
    OnBoardingModel(
      image: MyAppAssets.assetsImagesFrame3,
      title: 'Using modern AI technology for better user experience',
      description:
          'AI provide recommendations and helps you to continue the search journey',
    ),
  ];
