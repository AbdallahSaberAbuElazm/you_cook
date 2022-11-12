import 'package:you_cook/features/relish/domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel(
      {required super.categoryId,
      required super.categoryNameAr,
      required super.categoryNameEn});

  static CategoryModel fromJson(Map<String, dynamic> jsonObject) {
    return CategoryModel(
      categoryId: jsonObject['id'],
      categoryNameAr: jsonObject['name_ar'],
      categoryNameEn: jsonObject['name_en'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': categoryId,
      'name_ar': categoryNameAr,
      'name_en': categoryNameEn
    };
  }
}
