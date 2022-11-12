import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/hive_boxes.dart';
import 'package:you_cook/features/relish/presentation/pages/auth/register_relish.dart';
import 'package:you_cook/features/relish/presentation/pages/home_page.dart';
import 'package:you_cook/features/splash/data/models/onboarding_contents.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;

  Widget _buildDots({int? index}) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      height: 6,
      width: 6,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (_currentPage == index) ? redColor : greyColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: scaffoldBackground,
      appBar: AppBar(
        toolbarHeight: 0,
        shadowColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (value) =>
                        setState(() => _currentPage = value),
                    itemCount: contents.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          Container(
                              margin: EdgeInsets.all(
                                  MediaQuery.of(context).size.width / 14),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 1.7,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(18)),
                                image: DecorationImage(
                                  image: AssetImage(
                                    contents[i].image,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 33),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                contents.length,
                                (int index) => _buildDots(index: index),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 33,
                          ),
                          Text(contents[i].title,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline3),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).size.height / 33,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        if (_currentPage + 1 ==
                                            contents.length) {
                                          Get.off(() => const HomePage());
                                          HiveBoxes.changeShowHome(
                                              firstOpen: true);
                                        } else {
                                          _controller.nextPage(
                                              duration: const Duration(
                                                  milliseconds: 200),
                                              curve: Curves.easeIn);
                                        }
                                      },
                                      style: TextButton.styleFrom(
                                        elevation: 0,
                                        textStyle: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      child: Text("التالي",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      width: MediaQuery.of(context).size.width /
                                          37,
                                      child: Image.asset(
                                          'assets/images/onboarding_icon.png'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
