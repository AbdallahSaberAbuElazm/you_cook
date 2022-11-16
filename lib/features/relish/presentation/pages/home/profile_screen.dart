import 'package:flutter/material.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/app_bars.dart';
import 'package:you_cook/features/relish/presentation/widgets/user/profile_user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/profile_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: const ProfileUser()
        //  (HiveBoxes.getUserToken()!.isNotEmpty)
        //     ? const ProfileScreen()
        //     : const LoginRelish(),

        );
  }
}
