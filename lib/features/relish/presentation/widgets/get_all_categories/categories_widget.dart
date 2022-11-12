import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/features/relish/presentation/widgets/get_all_categories/loaded_horizonal_categoires_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 12,
        child: Obx(() {
          if (Controllers.categoryController.isLoading.value) {
            // return const LoadingWidget();
            return const SizedBox();
          } else {
            return LoadedHorizonalCategoriesWidget(
              categories: Controllers.categoryController.categories,
            );
          }
        }));
  }
}
