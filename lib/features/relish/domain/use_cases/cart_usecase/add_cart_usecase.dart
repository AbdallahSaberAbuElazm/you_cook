import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/cart.dart';
import 'package:you_cook/features/relish/domain/repositories/cart_repository.dart';

class AddCartUsecase {
  final CartRepository cartRepository;

  AddCartUsecase(this.cartRepository);

  Future<Either<Failure, Unit>> call({required Cart cart}) async {
    return await cartRepository.addCart(cart: cart);
  }
}
