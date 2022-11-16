import 'package:get/get_connect/http/src/response/response.dart';
import 'package:you_cook/core/error/exception.dart';
import 'package:you_cook/core/network/network.dart';
import 'package:you_cook/core/util/return_data_source.dart';
import 'package:you_cook/features/relish/data/data_sources/user_service_remote_data_source.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:you_cook/features/relish/data/models/user_service_model.dart';
import 'package:you_cook/features/relish/domain/entities/user_service.dart';
import 'package:you_cook/features/relish/domain/repositories/user_service_repository.dart';

class UserServiceModelRepository implements UserServiceRepository {
  final UserServiceRemoteDataSource userServiceRemoteDataSource;
  final NetworkInfo networkInfo;
  UserServiceModelRepository(
      {required this.userServiceRemoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, UserService>> getUserData(String accessToken) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(
            await userServiceRemoteDataSource.getUserData(accessToken));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserServiceModel>> loginUser(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await userServiceRemoteDataSource.loginUser(
            email: email, password: password));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logoutUser(String accessToken) {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> registerUser(
      Map<String, dynamic> userData) async {
    return await ReturnDataSource.getReturnMessage(
        func: () => userServiceRemoteDataSource.registerUser(userData),
        networkInfo: networkInfo);
  }

  @override
  Future<Either<Failure, UserService>> updateUserProfile(
      Map<String, dynamic> userData) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await userServiceRemoteDataSource.updateUserProfile(
            userData: userData));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
