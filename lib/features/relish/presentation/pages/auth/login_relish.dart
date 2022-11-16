import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/core/widgets/custom_text_form_field.dart';
import 'package:you_cook/core/widgets/go_elevated_btn.dart';
import 'package:you_cook/core/widgets/password_form_field.dart';
import 'package:you_cook/features/relish/presentation/pages/auth/register_relish.dart';
import 'package:you_cook/features/relish/presentation/pages/home/home.dart';
import 'package:you_cook/features/relish/presentation/pages/home/relish_screen.dart';

class LoginRelish extends StatefulWidget {
  const LoginRelish({
    super.key,
  });

  @override
  State<LoginRelish> createState() => _LoginRelishState();
}

class _LoginRelishState extends State<LoginRelish> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            extendBodyBehindAppBar: true,
            body: Form(
                key: _formKey,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2.5,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(36),
                              bottomRight: Radius.circular(36)),
                          image: DecorationImage(
                            image:
                                AssetImage("assets/images/relish_register.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 9),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text('تسجيل دخول',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline2),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 11,
                              right: MediaQuery.of(context).size.width / 11,
                              top: MediaQuery.of(context).size.height / 4.5),
                          child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: double.infinity,
                              margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 60,
                              ),
                              decoration: const BoxDecoration(
                                  color: scaffoldBackground,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(36))),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 18,
                                    right:
                                        MediaQuery.of(context).size.width / 18,
                                    top:
                                        MediaQuery.of(context).size.height / 10,
                                  ),
                                  child: Center(
                                    child: ListView(
                                      padding: EdgeInsets.zero,
                                      children: [
                                        CustomTextFormField(
                                          title: 'ايميل',
                                          controller: _emailController,
                                          isEnabled: true,
                                          keyboadType:
                                              TextInputType.emailAddress,
                                        ),
                                        PasswordFormField(
                                            controller: _passwordController,
                                            title: 'كلمة السر'),
                                        Padding(
                                            padding: EdgeInsets.only(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  34,
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  60,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                GoElevatedBtn(
                                                    onPressed: () {
                                                      Controllers.userController.loginUser(
                                                          email:
                                                              _emailController
                                                                  .text
                                                                  .trimLeft()
                                                                  .trimRight(),
                                                          password:
                                                              _passwordController
                                                                  .text
                                                                  .trimLeft()
                                                                  .trimRight());
                                                    },
                                                    title: 'تسجيل الدخول',
                                                    btnColor: redColor,
                                                    textColor: Colors.white),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      90,
                                                ),
                                                _drawText(
                                                    text: 'انشاء حساب',
                                                    onPressed: () {
                                                      Get.off(() =>
                                                          const RegisterRelish());
                                                    }),
                                                _drawText(
                                                    text: 'الدخول كزائر',
                                                    onPressed: () {
                                                      Get.off(() => Home(
                                                          recentPage:
                                                              const RelishScreen(),
                                                          selectedIndex: 0));
                                                    }),
                                              ],
                                            ))
                                      ],
                                    ),
                                  )))),
                    ],
                  ),
                ))));
  }

  Widget _drawText({required String text, required dynamic onPressed}) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              color: redColor, fontFamily: 'NotoKufiArabic', fontSize: 16),
        ));
  }
}
