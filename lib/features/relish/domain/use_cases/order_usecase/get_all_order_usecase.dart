import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/order.dart';
import 'package:you_cook/features/relish/domain/repositories/oder_repository.dart';

class GetAllOrderUsecase {
  final OrderRepository orderRepository;

  GetAllOrderUsecase(this.orderRepository);

  Future<Either<Failure, List<Orders>>> call() async {
    return await orderRepository.getAllOrders();
  }
}
