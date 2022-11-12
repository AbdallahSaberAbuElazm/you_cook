import 'package:equatable/equatable.dart';

class Privacy extends Equatable {
  final String privacyAr;
  final String privacyEn;

  const Privacy({required this.privacyAr, required this.privacyEn});

  @override
  List<Object?> get props => [privacyAr, privacyEn];
}
