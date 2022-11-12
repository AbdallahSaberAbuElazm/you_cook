import 'package:you_cook/features/relish/domain/entities/refund_policy.dart';

class RefundPolicyModel extends RefundPolicy {
  const RefundPolicyModel(
      {required super.refundPolicyAr, required super.refundPolicyEn});

  static RefundPolicyModel fromJson(Map<String, dynamic> objectObject) {
    return RefundPolicyModel(
        refundPolicyAr: objectObject['refund_policy_ar'],
        refundPolicyEn: objectObject['refund_policy_en']);
  }
}
