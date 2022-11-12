import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/features/relish/presentation/widgets/get_all_categories/categories_widget.dart';
import 'package:you_cook/features/relish/presentation/widgets/get_all_products/products_widget.dart';
import 'package:you_cook/features/relish/presentation/widgets/get_all_kitchen/kitchens_widget.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/app_bars.dart';

class RelishScreen extends StatefulWidget {
  const RelishScreen({super.key});

  @override
  State<RelishScreen> createState() => _RelishScreenState();
}

class _RelishScreenState extends State<RelishScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBars.buildRelishAppbar(
            context: context, controller: _searchController),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return RefreshIndicator(
      color: redColor,
      onRefresh: () => _buildRefersh(context),
      child: ListView(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 90,
            // bottom: MediaQuery.of(context).size.height / 90,
            left: MediaQuery.of(context).size.width / 30,
            right: MediaQuery.of(context).size.width / 30,
          ),
          children: [
            Text(
              'تصنيفات',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const CategoriesWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'المطابخ',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                TextButton(
                  onPressed: () => Get.to(() => const KitchensWidget(
                        getAllKitchens: true,
                      )),
                  child: Row(
                    children: const [
                      Text(
                        'مشاهدة المزيد',
                        style: TextStyle(color: redColor, fontSize: 12),
                      ),
                      Icon(
                        Icons.keyboard_double_arrow_left_rounded,
                        color: redColor,
                        size: 19,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const KitchensWidget(
              getAllKitchens: false,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 80,
                  bottom: MediaQuery.of(context).size.height / 90),
              child: Obx(
                () => Text(
                  Controllers
                      .selectedVariableController.selectedCategoryName.value,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            Center(
                child: ProductsWidget(
                    categoryId: Controllers
                        .selectedVariableController.selectedCategoryId.value))
          ]),
    );
  }

  Future<void> _buildRefersh(BuildContext context) async {
    Controllers.categoryController.fetchAllCategoriesFromRemoteData();
    Controllers.kitchenController.fetchAllKitchensFromRemoteData();
    Controllers.productController.fetchAllProductsFromRemoteData();
  }
}
