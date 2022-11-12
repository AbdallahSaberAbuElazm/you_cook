import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/favourite.dart';
import 'package:you_cook/features/relish/domain/repositories/favourite_repository.dart';

class AddFavouriteUsecase {
  final FavouriteRepository favouriteRepository;

  AddFavouriteUsecase(this.favouriteRepository);

  Future<Either<Failure, Unit>> call({required Favourite favourite}) async {
    return await favouriteRepository.addFavourite(favourite: favourite);
  }
}
