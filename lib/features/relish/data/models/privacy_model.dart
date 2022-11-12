import 'package:you_cook/features/relish/domain/entities/privacy.dart';

class PrivacyModel extends Privacy {
  const PrivacyModel({required super.privacyAr, required super.privacyEn});

  static PrivacyModel fromJson(Map<String, dynamic> objectJson) {
    return PrivacyModel(
        privacyAr: objectJson['privacy_ar'],
        privacyEn: objectJson['privacy_en']);
  }
}
