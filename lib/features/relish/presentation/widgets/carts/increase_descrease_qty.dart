import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/features/relish/domain/entities/product.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/icon_with_background.dart';

class MyWidget extends StatelessWidget {
  final Color iconBackgroundColor;
  final Color iconColor;
  final Color containerBackgroundColor;
  final int quantityNo;
  final Product product;

  const MyWidget(
      {super.key,
      required this.iconBackgroundColor,
      required this.iconColor,
      required this.containerBackgroundColor,
      required this.quantityNo,
      required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconWithBackground(
            backgroundColor: iconBackgroundColor,
            containerWidth: 31,
            containerHeight: 31,
            icon: Icons.add,
            iconColor: iconColor,
            iconSize: 24,
            onPressed: () {
              Controllers.selectedVariableController.increaseProductQuantity();
              product.productQuantity = Controllers
                  .selectedVariableController.selectedProductQuantity.value;
            }),
        const SizedBox(
          width: 4,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Obx(() => Text(
                Controllers
                    .selectedVariableController.selectedProductQuantity.value
                    .toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
              )),
        ),
        IconWithBackground(
            backgroundColor: iconBackgroundColor,
            containerWidth: 31,
            containerHeight: 31,
            icon: Icons.remove,
            iconColor: iconColor,
            iconSize: 24,
            onPressed: () {
              Controllers.selectedVariableController.decreaseProductQuantity();
            }),
      ],
    );
  }
}
