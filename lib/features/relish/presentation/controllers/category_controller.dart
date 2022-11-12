import 'package:dartz/dartz.dart';
import 'package:get/state_manager.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/core/strings/failure/failure.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/features/relish/domain/entities/category.dart';
import 'package:you_cook/features/relish/domain/use_cases/get_all_categories_usecase.dart';

class CategoryController extends GetxController {
  final categories = <Category>[].obs;
  var failureTxt = ''.obs;
  var isLoading = true.obs;

  final GetAllCategoryUsecase categoryUsecase;
  CategoryController({required this.categoryUsecase});

  @override
  void onInit() {
    fetchAllCategoriesFromRemoteData();
    super.onInit();
  }

  // Future<Either<String, List<Country>>>
  fetchAllCategoriesFromRemoteData() async {
    try {
      isLoading(true);
      var categoriesData = await categoryUsecase();
      _mapFailureOrCategories(categoriesData);
    } finally {
      isLoading(false);
    }
  }

  _mapFailureOrCategories(Either<Failure, List<Category>> either) {
    return either.fold((failure) {
      failureTxt.value = mapFailureToMessage(failure);
    }, (categoriesData) {
      Controllers.selectedVariableController.updateSelectedCategory(
          categoryId: categoriesData[0].categoryId,
          categoryName: categoriesData[0].categoryNameAr);
      failureTxt.value = '';
      categories.value = categoriesData;
    });
  }
}
