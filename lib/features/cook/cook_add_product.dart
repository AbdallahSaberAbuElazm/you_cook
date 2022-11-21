import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:you_cook/core/styles/color.dart';
import 'package:you_cook/core/util/api/upload_file.dart';
import 'package:you_cook/core/util/util.dart';
import 'package:you_cook/core/widgets/custom_text_area.dart';
import 'package:you_cook/core/widgets/custom_text_form_field.dart';
import 'package:you_cook/core/widgets/go_elevated_btn.dart';
import 'package:you_cook/features/relish/presentation/widgets/shared/app_bars.dart';

class CookAddProduct extends StatefulWidget {
  const CookAddProduct({super.key});

  @override
  State<CookAddProduct> createState() => _CookAddProductState();
}

class _CookAddProductState extends State<CookAddProduct> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productImageController = TextEditingController();
  final TextEditingController _productDiscountController =
      TextEditingController();
  @override
  void dispose() {
    _productDescriptionController.dispose();
    _productImageController.dispose();
    _productNameController.dispose();
    _productPriceController.dispose();
    _productDiscountController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        Util.timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBars.buildAppbarWithoutLeadingAndActions(
              context: context, title: 'إضافة منتج'),
          body: _buildBody(context: context),
        ));
  }

  _buildBody({required BuildContext context}) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 60,
                left: MediaQuery.of(context).size.width / 30,
                right: MediaQuery.of(context).size.width / 30),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 26),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text('أضف منتج الي قائمة منتجاتك',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline3),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 33,
                ),
                CustomTextFormField(
                  title: 'الاسم المنتج',
                  controller: _productNameController,
                  isEnabled: true,
                  keyboadType: TextInputType.name,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 55,
                ),
                CustomTextArea(
                    title: 'وصف المنتج',
                    controller: _productDescriptionController),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 55,
                ),
                CustomTextFormField(
                  title: 'سعر المنتج',
                  controller: _productPriceController,
                  isEnabled: true,
                  keyboadType: TextInputType.number,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 55,
                ),
                CustomTextFormField(
                  title: 'خصم علي النتج ان وجد',
                  controller: _productPriceController,
                  isEnabled: true,
                  keyboadType: TextInputType.number,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 33,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GoElevatedBtn(
                          onPressed: () async {
                            // UploadFile.getListOfImages(
                            //   context: context,
                            // );
                            UploadFile.getImage(
                                context: context,
                                controller: _productImageController);
                          },
                          title: 'ارفع صورة للمنتج',
                          btnColor: redColor,
                          textColor: whiteColor),
                    ],
                  ),
                ),
              ],
            )));
  }
}
