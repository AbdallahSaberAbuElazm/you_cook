import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/core/strings/failure/failure.dart';
import 'package:you_cook/features/relish/domain/entities/offer.dart';
import 'package:you_cook/features/relish/domain/use_cases/get_all_offers_usecase.dart';

class OfferController extends GetxController {
  final offers = <Offer>[].obs;
  final offersForKitchen = <Offer>[].obs;
  var failureTxt = ''.obs;
  var isLoading = true.obs;

  final GetAllOfferUsecase getAllOfferUsecase;
  OfferController({required this.getAllOfferUsecase});

  @override
  void onInit() {
    fetchAllOffersFromRemoteData();
    super.onInit();
  }

  fetchAllOffersFromRemoteData() async {
    try {
      isLoading(true);
      _mapFailureOrOffers(await getAllOfferUsecase());
    } finally {
      isLoading(false);
    }
  }

  _mapFailureOrOffers(Either<Failure, List<Offer>> either) {
    return either.fold((failure) {
      failureTxt.value = mapFailureToMessage(failure);
    }, (offersData) {
      failureTxt.value = '';
      offers.value = offersData;
    });
  }

  getOffersForKitchens({required int kitchenId}) {
    try {
      isLoading.value = true;
      offersForKitchen.value =
          offers.where((offer) => offer.kitchenId == kitchenId).toList();
      update();
    } finally {
      isLoading.value = false;
    }
  }
}
