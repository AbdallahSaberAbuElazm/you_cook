import 'package:equatable/equatable.dart';

class RefundPolicy extends Equatable {
  final String refundPolicyAr;
  final String refundPolicyEn;

  const RefundPolicy(
      {required this.refundPolicyAr, required this.refundPolicyEn});

  @override
  List<Object?> get props => [refundPolicyAr, refundPolicyEn];
}
