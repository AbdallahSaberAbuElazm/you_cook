import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/cart_items.dart';
import 'package:you_cook/features/relish/domain/repositories/cart_repository.dart';

class AddCartUsecase {
  final CartRepository cartRepository;

  AddCartUsecase(this.cartRepository);

  Future<Either<Failure, Unit>> call({required CartItems cartItem}) async {
    return await cartRepository.addCart(cartItem: cartItem);
  }
}
