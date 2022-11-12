import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/repositories/oder_repository.dart';

class DeleteOrderUsecase {
  final OrderRepository orderRepository;

  DeleteOrderUsecase(this.orderRepository);

  Future<Either<Failure, Unit>> call({required int orderId}) async {
    return await orderRepository.deleteOrder(orderId: orderId);
  }
}
