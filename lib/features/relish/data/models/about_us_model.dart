import 'package:you_cook/features/relish/domain/entities/about_us.dart';

class AboutUsModel extends AboutUs {
  const AboutUsModel({required super.aboutUsAr, required super.aboutUsEn});

  static AboutUsModel fromJson(Map<String, dynamic> objectJson) {
    return AboutUsModel(
        aboutUsAr: objectJson['about_us_ar'],
        aboutUsEn: objectJson['about_us_en']);
  }
}
