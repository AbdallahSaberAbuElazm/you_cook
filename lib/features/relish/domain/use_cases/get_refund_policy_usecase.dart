import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/refund_policy.dart';
import 'package:you_cook/features/relish/domain/repositories/refund_policy.dart';

class GetRefundPolicyUsecase {
  final RefundPolicyRepository refundPloicyRepository;

  GetRefundPolicyUsecase(this.refundPloicyRepository);

  Future<Either<Failure, List<RefundPolicy>>> call() async {
    return await refundPloicyRepository.getRefundPolicyData();
  }
}
