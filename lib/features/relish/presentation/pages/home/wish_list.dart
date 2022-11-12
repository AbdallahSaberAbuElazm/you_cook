import 'package:flutter/material.dart';
import 'package:you_cook/features/relish/presentation/widgets/favourite/loaded_favourite_widget.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/app_bars.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBars.buildAppbarWithoutLeadingAndActions(
            context: context, title: 'المفضلة'),
        body: _buildBody(context: context),
      ),
    );
  }

  Widget _buildBody({required BuildContext context}) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 60,
                left: MediaQuery.of(context).size.width / 30,
                right: MediaQuery.of(context).size.width / 30),
            child: const ListOfFavourites()));
  }
}
