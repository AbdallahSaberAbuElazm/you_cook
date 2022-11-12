import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/core/strings/failure/failure.dart';
import 'package:you_cook/features/relish/domain/entities/kitchen.dart';
import 'package:you_cook/features/relish/domain/use_cases/get_all_kitchens_usercase.dart';

class KitchenController extends GetxController {
  final kitchens = <Kitchen>[].obs;
  var failureTxt = ''.obs;
  var isLoading = true.obs;

  final GetAllKitchensUsecase getAllKitchensUsecase;
  KitchenController({required this.getAllKitchensUsecase});

  @override
  void onInit() {
    fetchAllKitchensFromRemoteData();
    super.onInit();
  }

  // Future<Either<String, List<Country>>>
  fetchAllKitchensFromRemoteData() async {
    try {
      isLoading(true);
      var kitchensData = await getAllKitchensUsecase();
      _mapFailureOrCategories(kitchensData);
    } finally {
      isLoading(false);
    }
  }

  _mapFailureOrCategories(Either<Failure, List<Kitchen>> either) {
    return either.fold((failure) {
      failureTxt.value = mapFailureToMessage(failure);
    }, (countriesData) {
      failureTxt.value = '';
      kitchens.value = countriesData;
    });
  }
}
