import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/repositories/favourite_repository.dart';

class DeleteFavouriteUsecase {
  final FavouriteRepository favouriteRepository;

  DeleteFavouriteUsecase(this.favouriteRepository);

  Future<Either<Failure, Unit>> call({required int productId}) async {
    return await favouriteRepository.deleteFavourite(productId: productId);
  }
}
