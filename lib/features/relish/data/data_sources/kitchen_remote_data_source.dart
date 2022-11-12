import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:you_cook/core/error/exception.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/features/relish/data/models/kitchen_model.dart';

abstract class KitchenRemoteDataSource {
  Future<List<KitchenModel>> getAllKitchen();
}

class KitchenRemoteDataSourceImpl implements KitchenRemoteDataSource {
  final http.Client client;
  KitchenRemoteDataSourceImpl({required this.client});
  @override
  Future<List<KitchenModel>> getAllKitchen() async {
    var response = await client.get(Uri.parse(ApiUrl.KITCHENS_URL));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      List<KitchenModel> kitchens =
          body['kitchens'].map<KitchenModel>((kitchenModel) {
        return KitchenModel.fromJson(kitchenModel);
      }).toList();
      return kitchens;
    } else {
      throw ServerException();
    }
  }
}
