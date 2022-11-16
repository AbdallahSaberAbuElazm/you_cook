import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/repositories/cart_repository.dart';

class DeleteCartItemUsecase {
  final CartRepository cartRepository;

  DeleteCartItemUsecase(this.cartRepository);

  Future<Either<Failure, Unit>> call({required int cartItemId}) async {
    return await cartRepository.deleteCartItem(cartId: cartItemId);
  }
}
