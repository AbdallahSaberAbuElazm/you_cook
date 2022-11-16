import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/api/upload_file.dart';
import 'package:you_cook/core/util/hive_boxes.dart';
import 'package:you_cook/core/util/shared_obects_controllers.dart';
import 'package:you_cook/core/widgets/custom_text_form_field.dart';
import 'package:you_cook/core/widgets/go_elevated_btn.dart';
import 'package:you_cook/core/widgets/password_form_field.dart';
import 'package:you_cook/features/relish/data/models/user_service_model.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _editPasswordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _userNameController.text = HiveBoxes.getUserName()!;
    _emailController.text = HiveBoxes.getEmail()!;
    _phoneNumberController.text = HiveBoxes.getPhoneNumber()!;
    _areaController.text = HiveBoxes.getUserArea()!;
    _addressController.text = HiveBoxes.getUserAddress()!;
    _imageController.text = HiveBoxes.getUserImageProfile()!;
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _editPasswordController.dispose();
    _phoneNumberController.dispose();
    _areaController.dispose();
    _addressController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 11,
            right: MediaQuery.of(context).size.width / 11,
            top: MediaQuery.of(context).size.height / 200),
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 80,
            ),
            decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30))),
            child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 18,
                  right: MediaQuery.of(context).size.width / 18,
                  top: MediaQuery.of(context).size.height / 90,
                ),
                child: Form(
                    key: _formKey,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        InkWell(
                          onTap: () async {
                            UploadFile.getImage(
                                    context: context,
                                    controller: _imageController)
                                .then((value) => HiveBoxes.setUserImageProfile(
                                    userImage: _imageController.text));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 11,
                            height: MediaQuery.of(context).size.height / 12,
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 4,
                                right: MediaQuery.of(context).size.width / 4,
                                // top: MediaQuery.of(context).size.height / 150,
                                bottom:
                                    MediaQuery.of(context).size.height / 100),
                            decoration: const BoxDecoration(
                              color: greyColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.person,
                              color: whiteColor,
                              size: 52,
                            ),
                          ),
                        ),
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
                              top: MediaQuery.of(context).size.height / 50,
                              bottom: MediaQuery.of(context).size.height / 90,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GoElevatedBtn(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        if (_passwordController.text ==
                                            _editPasswordController.text) {
                                          Controllers.userController
                                              .updateUserData(
                                                  userInfo: UserServiceModel(
                                                      userId: HiveBoxes
                                                          .getUserId()!,
                                                      userName:
                                                          _userNameController
                                                              .text,
                                                      email:
                                                          _emailController.text,
                                                      phoneNumber:
                                                          _phoneNumberController
                                                              .text,
                                                      area:
                                                          _areaController.text,
                                                      address:
                                                          _addressController
                                                              .text));
                                        }
                                      }
                                    },
                                    title: 'حفظ',
                                    btnColor: redColor,
                                    textColor: Colors.white),
                              ],
                            )),
                      ],
                    )))));
  }
}
