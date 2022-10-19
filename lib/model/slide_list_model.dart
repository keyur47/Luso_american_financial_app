

import 'package:luso_american_financial/utils/assets_path.dart';

class Slide {
  final String imageUrl;
  final String title;

  Slide({
    required this.imageUrl,
    required this.title,
  });
}

final slideList = [
  Slide(
    imageUrl: AssetsPath.onboarding1,
    title: 'Great Retirement and\nAnnuity Rates!',
  ),
  Slide(
    imageUrl: AssetsPath.onboarding2,
    title: 'Working Together for our\nCommunity',
  ),
  Slide(
    imageUrl: AssetsPath.onboarding3,
    title: 'Laying the Groundwork for\nTomorrow\'s  Leaders',
  ),
];



class AdsSlide {
  final String imageUrl;
  final String title;

  AdsSlide({
    required this.imageUrl,
    required this.title,
  });
}

final adsSlideList = [
  AdsSlide(
    imageUrl: AssetsPath.image1,
    title: 'Great Retirement and\nAnnuity Rates!',
  ),
  AdsSlide(
    imageUrl: AssetsPath.image2,
    title: 'Working Together for our Community',
  ),
  AdsSlide(
    imageUrl: AssetsPath.image3,
    title: 'Laying the Groundwork for Tomorrow\'s  Leaders',
  ),
  AdsSlide(
    imageUrl: AssetsPath.image1,
    title: 'Laying the Groundwork for Tomorrow\'s  Leaders',
  ),
  AdsSlide(
    imageUrl: AssetsPath.image2,
    title: 'Laying the Groundwork for Tomorrow\'s  Leaders',
  ),
];






