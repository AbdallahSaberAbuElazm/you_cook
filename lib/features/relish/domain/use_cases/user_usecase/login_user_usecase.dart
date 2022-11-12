import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/user_service.dart';
import 'package:you_cook/features/relish/domain/repositories/user_service_repository.dart';

class LoginUserServiceUsecase {
  final UserServiceRepository userServiceRepository;

  LoginUserServiceUsecase({
    required this.userServiceRepository,
  });

  Future<Either<Failure, UserService>> call(
      {required String email, required String password}) async {
    return await userServiceRepository.loginUser(email, password);
  }
}
