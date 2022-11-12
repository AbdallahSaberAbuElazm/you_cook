import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:you_cook/core/error/exception.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/features/relish/data/models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getAllCateogry();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final http.Client client;
  CategoryRemoteDataSourceImpl({required this.client});
  @override
  Future<List<CategoryModel>> getAllCateogry() async {
    var response = await client.get(Uri.parse(ApiUrl.CATEGORIES_URL));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      List<CategoryModel> categories =
          body['data'].map<CategoryModel>((categoryModel) {
        return CategoryModel.fromJson(categoryModel);
      }).toList();
      return categories;
    } else {
      throw ServerException();
    }
  }
}
