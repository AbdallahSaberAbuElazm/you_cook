import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/order.dart';
import 'package:you_cook/features/relish/domain/repositories/oder_repository.dart';

class AddOrderUsecase {
  final OrderRepository orderRepository;

  AddOrderUsecase(this.orderRepository);

  Future<Either<Failure, Unit>> call({required Orders order}) async {
    return await orderRepository.addOrder(order: order);
  }
}
