import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:you_cook/core/error/exception.dart';
import 'package:you_cook/core/strings/api/api_url.dart';
import 'package:you_cook/core/util/hive_boxes.dart';
import 'package:you_cook/core/util/return_data_source.dart';
import 'package:you_cook/features/relish/data/models/user_service.dart';
import 'package:you_cook/features/relish/presentation/pages/auth/login_relish.dart';
import 'package:you_cook/features/relish/presentation/pages/home/home.dart';
import 'package:you_cook/features/relish/presentation/pages/home/relish_screen.dart';

abstract class UserServiceRemoteDataSourceImpl {
  Future<UserServiceModel> getUserData(String accessToken);
  Future<Unit> registerUser(Map<String, dynamic> userData);
  Future<UserServiceModel> loginUser(
      {required String email, required String password});
  Future<void> logoutUser(String accesstoken);
}

class UserServiceRemoteDataSource implements UserServiceRemoteDataSourceImpl {
  final http.Client client;
  UserServiceRemoteDataSource({required this.client});

  @override
  Future<UserServiceModel> getUserData(String accessToken) {
    // TODO: implement getUserData
    throw UnimplementedError();
  }

  @override
  Future<UserServiceModel> loginUser(
      {required String email, required String password}) async {
    var response = await client.post(
      Uri.parse(ApiUrl.LOGIN_URL),
      body: json.encode({'email': email, 'password': password}),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> bodyData = json.decode(response.body);
      UserServiceModel user =
          UserServiceModel.fromJson(bodyData['data']['user']);
      HiveBoxes.setUserData(userServiceModel: user);
      HiveBoxes.setUserToken(userToken: bodyData['data']['token']);
      Get.off(() => Home(recentPage: const RelishScreen(), selectedIndex: 0));
      return user;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> logoutUser(String accesstoken) {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }

  @override
  Future<Unit> registerUser(Map<String, dynamic> userData) async {
    var body = {
      'first_name': userData['userName'],
      'email': userData['email'],
      'phone': userData['phoneNumber'],
      'phone_ext': userData['address'],
      'last_name': userData['area'],
      'gender': 'male',
      'type': 'user',
      'password': userData['password']
    };
    var response = await client.post(
      Uri.parse(ApiUrl.REGISTER_URL),
      body: json.encode(body),
      headers: {
        // HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
        "Content-Type": "application/json",
        // "Access-Control-Allow-Origin": "*"
      },
    );

    return await ReturnDataSource.checkStatusCodeForDeleteUpdateData(
            response: response, statusCode: 201)
        .then((value) {
      final responseJson = json.decode(response.body);
      // Get.off(() => Home(recentPage: const RelishScreen(), selectedIndex: 0));
      Get.off(() => const LoginRelish());
      return HiveBoxes.setUserToken(userToken: responseJson['token']);
    });
  }
}
