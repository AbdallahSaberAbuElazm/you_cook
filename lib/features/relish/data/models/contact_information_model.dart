import 'package:you_cook/features/relish/domain/entities/contact_information.dart';

class ContactInformationModel extends ContactInformation {
  const ContactInformationModel(
      {required super.contactDescriptionAr,
      required super.contactDescriptionEn,
      required super.contactPhoneNumber,
      required super.contactWhatsApp,
      required super.contactEmail,
      required super.contactFacebook,
      required super.contactTwitter,
      required super.contactGoogle,
      required super.contactInstagram});

  static ContactInformationModel fromJson(Map<String, dynamic> objectJson) {
    return ContactInformationModel(
        contactDescriptionAr: objectJson['description_ar'],
        contactDescriptionEn: objectJson['description_en'],
        contactPhoneNumber: objectJson['phone'],
        contactWhatsApp: objectJson['whats_app'],
        contactEmail: objectJson['email'],
        contactFacebook: objectJson['facebook'],
        contactTwitter: objectJson['twitter'],
        contactGoogle: objectJson['google'],
        contactInstagram: objectJson['instagram']);
  }
}
