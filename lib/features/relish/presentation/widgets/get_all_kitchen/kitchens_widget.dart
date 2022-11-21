import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/core/widgets/loading_widget.dart';
import 'package:you_cook/features/relish/presentation/controllers/offer_controller.dart';
import 'package:you_cook/features/relish/presentation/pages/home/relish_home.dart';
import 'package:you_cook/features/relish/presentation/widgets/get_all_kitchen/loaded_kitchens_widget.dart';
import 'package:you_cook/features/relish/presentation/pages/kitchens/kitchens_screen.dart';

class KitchensWidget extends StatelessWidget {
  final bool getAllKitchens;
  const KitchensWidget({super.key, required this.getAllKitchens});

  @override
  Widget build(BuildContext context) {
    Get.find<OfferController>();
    if (getAllKitchens) {
      return RelishHome(recentPage: const KitchensScreen(), selectedIndex: 0);
    } else {
      return Obx(() {
        if (Controllers.kitchenController.isLoading.value) {
          return const LoadingWidget();
        } else {
          return LoadedKitchensWidget(
            kitchens: Controllers.kitchenController.kitchens,
          );
        }
      });
    }
  }
}
