import 'package:equatable/equatable.dart';

class ContactInformation extends Equatable {
  final String contactDescriptionAr;
  final String contactDescriptionEn;
  final String contactPhoneNumber;
  final String contactWhatsApp;
  final String contactEmail;
  final String contactFacebook;
  final String contactTwitter;
  final String contactGoogle;
  final String contactInstagram;

  const ContactInformation(
      {required this.contactDescriptionAr,
      required this.contactDescriptionEn,
      required this.contactPhoneNumber,
      required this.contactWhatsApp,
      required this.contactEmail,
      required this.contactFacebook,
      required this.contactTwitter,
      required this.contactGoogle,
      required this.contactInstagram});

  @override
  List<Object?> get props => [
        contactDescriptionAr,
        contactDescriptionEn,
        contactPhoneNumber,
        contactWhatsApp,
        contactEmail,
        contactFacebook,
        contactTwitter,
        contactGoogle,
        contactInstagram
      ];
}
