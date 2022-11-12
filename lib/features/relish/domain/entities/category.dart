import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int categoryId;
  final String categoryNameAr;
  final String categoryNameEn;

  const Category(
      {required this.categoryId,
      required this.categoryNameAr,
      required this.categoryNameEn});

  @override
  List<Object?> get props => [categoryId, categoryNameAr, categoryNameEn];
}
