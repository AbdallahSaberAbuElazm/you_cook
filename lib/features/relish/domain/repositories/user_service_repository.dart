import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/user_service.dart';

abstract class UserServiceRepository {
  Future<Either<Failure, UserService>> getUserData(String accesstoken);
  Future<Either<Failure, Unit>> registerUser(Map<String, dynamic> userData);
  Future<Either<Failure, UserService>> loginUser(String email, String password);
  Future<Either<Failure, Unit>> logoutUser(String accesstoken);
  Future<Either<Failure, UserService>> updateUserProfile(
      Map<String, dynamic> userData);
}
