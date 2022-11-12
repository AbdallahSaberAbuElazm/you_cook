class OnboardingContents {
  final String title;
  final String image;

  OnboardingContents({
    required this.title,
    required this.image,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: 'ابحث عن أفضل الطعام \n بالقرب منك ',
    image: "assets/images/onboarding1.png",
  ),
  OnboardingContents(
    title: "التسليم الفوري إلي \n مكانك",
    image: "assets/images/onboarding2.png",
  ),
  OnboardingContents(
    title: "استمتع بوجبتك المفضلة",
    image: "assets/images/onboarding3.png",
  ),
];
