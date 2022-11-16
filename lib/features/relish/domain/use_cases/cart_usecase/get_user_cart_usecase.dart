import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/cart.dart';
import 'package:you_cook/features/relish/domain/repositories/cart_repository.dart';

class GetAllCartUsecase {
  final CartRepository cartRepository;

  GetAllCartUsecase(this.cartRepository);

  Future<Either<Failure, List<Cart>>> call() async {
    return await cartRepository.getAllCarts();
  }
}
