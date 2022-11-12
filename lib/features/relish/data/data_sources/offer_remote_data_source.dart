import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:you_cook/core/error/exception.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/features/relish/data/models/offer_model.dart';

abstract class OfferRemoteDataSource {
  Future<List<OfferModel>> getAllOffer();
}

class OfferRemoteDataSourceImpl implements OfferRemoteDataSource {
  final http.Client client;
  OfferRemoteDataSourceImpl({required this.client});
  @override
  Future<List<OfferModel>> getAllOffer() async {
    var response = await client.get(Uri.parse(ApiUrl.OFFERS_URL));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      List<OfferModel> offers = body['offers'].map<OfferModel>((offerModel) {
        return OfferModel.fromJson(offerModel);
      }).toList();
      return offers;
    } else {
      throw ServerException();
    }
  }
}
