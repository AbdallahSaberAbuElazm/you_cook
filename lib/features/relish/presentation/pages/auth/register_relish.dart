import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/features/relish/presentation/pages/home/home.dart';
import 'package:you_cook/features/relish/presentation/pages/home/relish_screen.dart';
import 'package:you_cook/core/widgets/custom_text_form_field.dart';
import 'package:you_cook/core/widgets/go_elevated_btn.dart';
import 'package:you_cook/core/widgets/password_form_field.dart';
import 'package:http/http.dart' as http;

class RegisterRelish extends StatefulWidget {
  const RegisterRelish({
    super.key,
  });

  @override
  State<RegisterRelish> createState() => _RegisterRelishState();
}

class _RegisterRelishState extends State<RegisterRelish> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _editPasswordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _editPasswordController.dispose();
    _phoneNumberController.dispose();
    _areaController.dispose();
    _addressController.dispose();
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
                              top: MediaQuery.of(context).size.height / 12),
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
                              top: MediaQuery.of(context).size.height / 6),
                          child: Container(
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
                                        MediaQuery.of(context).size.height / 30,
                                  ),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    children: [
                                      CustomTextFormField(
                                        title: 'الاسم بالكامل',
                                        controller: _userNameController,
                                        isEnabled: true,
                                        keyboadType: TextInputType.name,
                                      ),
                                      CustomTextFormField(
                                        title: 'ايميل',
                                        controller: _emailController,
                                        isEnabled: true,
                                        keyboadType: TextInputType.emailAddress,
                                      ),
                                      CustomTextFormField(
                                        title: 'رقم الجوال',
                                        controller: _phoneNumberController,
                                        isEnabled: true,
                                        keyboadType: TextInputType.phone,
                                      ),
                                      CustomTextFormField(
                                        title: 'المنطقة',
                                        controller: _areaController,
                                        isEnabled: true,
                                        keyboadType: TextInputType.name,
                                      ),
                                      CustomTextFormField(
                                        title: 'العنوان',
                                        controller: _addressController,
                                        isEnabled: true,
                                        keyboadType: TextInputType.name,
                                      ),
                                      PasswordFormField(
                                          controller: _passwordController,
                                          title: 'كلمة السر'),
                                      PasswordFormField(
                                          controller: _editPasswordController,
                                          title: 'تأكيد كلمة السر'),
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
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              GoElevatedBtn(
                                                  onPressed: () async {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      if (_passwordController
                                                              .text ==
                                                          _editPasswordController
                                                              .text) {
                                                        Controllers
                                                            .userController
                                                            .registerUser(
                                                                userInfo: {
                                                              'userName':
                                                                  _userNameController
                                                                      .text,
                                                              'email':
                                                                  _emailController
                                                                      .text,
                                                              'phoneNumber':
                                                                  _phoneNumberController
                                                                      .text,
                                                              'area':
                                                                  _areaController
                                                                      .text,
                                                              'address':
                                                                  _addressController
                                                                      .text,
                                                              'password':
                                                                  _passwordController
                                                                      .text,
                                                            });
                                                      }
                                                    }
                                                  },
                                                  title: 'التالي',
                                                  btnColor: redColor,
                                                  textColor: Colors.white),
                                            ],
                                          )),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GoElevatedBtn(
                                              onPressed: () {
                                                Get.off(() => Home(
                                                    recentPage:
                                                        const RelishScreen(),
                                                    selectedIndex: 0));
                                              },
                                              title: 'الدخول كزائر',
                                              btnColor: redColor,
                                              textColor: Colors.white),
                                        ],
                                      )
                                    ],
                                  )))),
                    ],
                  ),
                ))));
  }
}
