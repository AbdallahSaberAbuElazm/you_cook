import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/refund_policy.dart';

abstract class RefundPolicyRepository {
  Future<Either<Failure, List<RefundPolicy>>> getRefundPolicyData();
}
