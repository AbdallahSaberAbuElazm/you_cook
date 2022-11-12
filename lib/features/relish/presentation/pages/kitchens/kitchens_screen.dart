import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/core/widgets/loading_widget.dart';
import 'package:you_cook/features/relish/presentation/widgets/get_all_kitchen/loaded_vertical_kitchens_widget.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/app_bars.dart';

class KitchensScreen extends StatefulWidget {
  const KitchensScreen({
    super.key,
  });

  @override
  State<KitchensScreen> createState() => _KitchensScreenState();
}

class _KitchensScreenState extends State<KitchensScreen> {
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
            body: _buildBody()));
  }

  Widget _buildBody() {
    return RefreshIndicator(
      color: redColor,
      onRefresh: () => _buildRefersh(context),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 90,
            bottom: MediaQuery.of(context).size.height / 90,
            left: MediaQuery.of(context).size.width / 30,
            right: MediaQuery.of(context).size.width / 30,
          ),
          children: [
            Text(
              'المطابخ',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Obx(() {
              if (Controllers.kitchenController.isLoading.value) {
                return const LoadingWidget();
              } else {
                return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: const LoadedVerticalKitchens());
              }
            })
          ],
        ),
      ),
    );
  }

  Future<void> _buildRefersh(BuildContext context) async {
    // BlocProvider.of<KitchenBloc>(context).add(RefreshKitchensEvent());
    Controllers.kitchenController.fetchAllKitchensFromRemoteData();
  }
}
