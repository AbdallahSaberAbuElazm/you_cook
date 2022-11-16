import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/cart.dart';
import 'package:you_cook/features/relish/domain/repositories/cart_repository.dart';

class GetSpecificCartUsecase {
  final CartRepository cartRepository;

  GetSpecificCartUsecase(this.cartRepository);

  Future<Either<Failure, Cart>> call({required int cartId}) async {
    return await cartRepository.getSpecificCart(cartId: cartId);
  }
}
