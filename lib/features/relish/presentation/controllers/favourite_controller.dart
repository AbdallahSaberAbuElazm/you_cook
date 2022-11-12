import 'package:dartz/dartz.dart';
import 'package:get/state_manager.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/favourite.dart';
import 'package:you_cook/features/relish/domain/entities/product.dart';
import 'package:you_cook/features/relish/domain/use_cases/favourite_usecase/add_favourite_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/favourite_usecase/delete_favourite_usecase.dart';
import 'package:you_cook/features/relish/domain/use_cases/favourite_usecase/get_all_favourite_usecase.dart';

class FavouriteController extends GetxController {
  final favourites = <Favourite>[].obs;
  var isLoading = true.obs;

  final GetAllFavouriteUsecase favouriteUsecase;
  final AddFavouriteUsecase addFavouriteUsecase;
  final DeleteFavouriteUsecase deleteFavouriteUsecase;
  FavouriteController(
      {required this.favouriteUsecase,
      required this.addFavouriteUsecase,
      required this.deleteFavouriteUsecase});

  @override
  void onInit() {
    fetchAllFavouritesFromRemoteData();
    super.onInit();
  }

  // Future<Either<String, List<Country>>>
  fetchAllFavouritesFromRemoteData() async {
    try {
      isLoading(true);
      var favouritesData = await favouriteUsecase();
      _mapFailureOrFavourites(favouritesData);
    } finally {
      isLoading(false);
    }
  }

  _mapFailureOrFavourites(Either<Failure, List<Favourite>> either) {
    return either.fold((failure) {
      // failureTxt.value = mapFailureToMessage(failure);
    }, (favouritesData) {
      favourites.value = favouritesData;
    });
  }

  addProductToFavouriteList({required Favourite favourite}) {
    if (!favourites.contains(favourite)) {
      favourites.add(favourite);
    }
  }

  removeProductFromFavouriteList({required Product product}) {
    if (favourites.contains(favourites
        .where((favourite) => favourite.productId == product.productId)
        .single)) {
      final removeFavourite = favourites
          .indexWhere((favourite) => favourite.productId == product.productId);
      favourites.removeAt(removeFavourite);
    }
  }
}
