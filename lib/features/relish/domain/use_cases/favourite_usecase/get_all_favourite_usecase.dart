import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/favourite.dart';
import 'package:you_cook/features/relish/domain/repositories/favourite_repository.dart';

class GetAllFavouriteUsecase {
  final FavouriteRepository favouriteRepository;

  GetAllFavouriteUsecase(this.favouriteRepository);

  Future<Either<Failure, List<Favourite>>> call() async {
    return await favouriteRepository.getAllFavourites();
  }
}
