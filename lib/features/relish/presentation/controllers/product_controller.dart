import 'package:dartz/dartz.dart';
import 'package:get/state_manager.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/core/strings/failure/failure.dart';
import 'package:you_cook/features/relish/domain/entities/product.dart';
import 'package:you_cook/features/relish/domain/use_cases/get_all_products_usecase.dart';

class ProductController extends GetxController {
  final products = <Product>[].obs;
  var failureTxt = ''.obs;
  var isLoading = true.obs;

  final GetAllProductsUsecase getAllProductsUsecase;
  ProductController({required this.getAllProductsUsecase});

  @override
  void onInit() {
    fetchAllProductsFromRemoteData();
    super.onInit();
  }

  // Future<Either<String, List<Country>>>
  fetchAllProductsFromRemoteData() async {
    try {
      isLoading(true);
      var productsData = await getAllProductsUsecase();
      _mapFailureOrProducts(productsData);
    } finally {
      isLoading(false);
    }
  }

  _mapFailureOrProducts(Either<Failure, List<Product>> either) {
    return either.fold((failure) {
      failureTxt.value = mapFailureToMessage(failure);
    }, (countriesData) {
      failureTxt.value = '';
      products.value = countriesData;
    });
  }
}
