import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:you_cook/core/error/exception.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/core/util/return_data_source.dart';
import 'package:you_cook/features/relish/data/models/favourite_model.dart';

abstract class FavouriteRemoteDataSource {
  Future<List<FavouriteModel>> getAllFavourites();
  Future<Unit> addFavourite({required FavouriteModel favouriteModel});
  Future<Unit> deleteFavourite({required int favouriteId});
}

class FavouriteRemoteDataSourceImpl implements FavouriteRemoteDataSource {
  final http.Client client;
  FavouriteRemoteDataSourceImpl({required this.client});

  @override
  Future<List<FavouriteModel>> getAllFavourites() async {
    var response = await client.get(Uri.parse(ApiUrl.CATEGORIES_URL));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      List<FavouriteModel> favouriteModel =
          body['data'].map<FavouriteModel>((favouriteModel) {
        return FavouriteModel.fromJson(favouriteModel);
      }).toList();
      return favouriteModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addFavourite({required FavouriteModel favouriteModel}) async {
    final body = {
      'user_id': favouriteModel.userId,
      'product_id': favouriteModel.productId,
    };

    final response =
        await client.post(Uri.parse(ApiUrl.FAVOURITES_URL), body: body);
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteFavourite({required int favouriteId}) async {
    final response = await client.delete(
        Uri.parse('${''}/${favouriteId.toString()}/delete'),
        headers: {'Content-Type': 'application/json'});
    return ReturnDataSource.checkStatusCodeForDeleteUpdateData(
        response: response, statusCode: 200);
  }
}
