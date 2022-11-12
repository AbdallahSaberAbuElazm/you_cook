import 'package:equatable/equatable.dart';

class Terms extends Equatable {
  final String termsAr;
  final String termsEn;

  const Terms({required this.termsAr, required this.termsEn});

  @override
  List<Object?> get props => [termsAr, termsEn];
}
