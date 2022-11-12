import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/features/relish/presentation/widgets/get_all_products/loaded_products_widget.dart';

class ProductsWidget extends StatelessWidget {
  final int categoryId;
  const ProductsWidget({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (Controllers.productController.isLoading.value) {
        // return const LoadingWidget();
        return const SizedBox();
      } else {
        return LoadedProductsWidget(
          products: Controllers.productController.products,
        );
      }
    });
  }
}
