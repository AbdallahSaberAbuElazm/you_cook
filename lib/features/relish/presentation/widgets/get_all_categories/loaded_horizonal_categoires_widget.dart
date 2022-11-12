import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/features/relish/domain/entities/category.dart';

class LoadedHorizonalCategoriesWidget extends StatelessWidget {
  final List<Category> categories;
  const LoadedHorizonalCategoriesWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Row(children: [
          Obx(() {
            return InkWell(
              onTap: () {
                Controllers.selectedVariableController.updateSelectedCategory(
                    categoryId: categories[index].categoryId,
                    categoryName: categories[index].categoryNameAr);
              },
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 80,
                    bottom: MediaQuery.of(context).size.height / 80,
                    left: MediaQuery.of(context).size.width / 40,
                    right: MediaQuery.of(context).size.width / 40),
                decoration: BoxDecoration(
                    color: (Controllers.selectedVariableController
                                .selectedCategoryId.value ==
                            categories[index].categoryId)
                        ? redColor
                        : lightGreyColor,
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                child: Text(
                  categories[index].categoryNameAr,
                  style: TextStyle(
                    color: (Controllers.selectedVariableController
                                .selectedCategoryId.value ==
                            categories[index].categoryId)
                        ? whiteColor
                        : blackColor,
                    fontSize: 12,
                    fontFamily: 'NotoKufiArabic',
                  ),
                ),
              ),
            );
          }),
          const SizedBox(
            width: 10,
          )
        ]);
      },
    );
  }
}
