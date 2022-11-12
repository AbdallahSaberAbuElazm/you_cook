import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/repositories/cart_repository.dart';

class DeleteCartUsecase {
  final CartRepository cartRepository;

  DeleteCartUsecase(this.cartRepository);

  Future<Either<Failure, Unit>> call({required int cartId}) async {
    return await cartRepository.deleteCart(cartId: cartId);
  }
}
