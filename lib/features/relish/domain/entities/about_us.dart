import 'package:equatable/equatable.dart';

class AboutUs extends Equatable {
  final String aboutUsAr;
  final String aboutUsEn;

  const AboutUs({required this.aboutUsAr, required this.aboutUsEn});

  @override
  List<Object?> get props => [aboutUsAr, aboutUsEn];
}
