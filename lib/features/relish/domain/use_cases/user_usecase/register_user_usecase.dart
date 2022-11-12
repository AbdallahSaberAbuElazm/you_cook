import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/repositories/user_service_repository.dart';

class RegisterUserServiceUsecase {
  final UserServiceRepository userServiceRepository;

  RegisterUserServiceUsecase({
    required this.userServiceRepository,
  });

  Future<Either<Failure, Unit>> call(
      {required Map<String, dynamic> userData}) async {
    return await userServiceRepository.registerUser(userData);
  }
}
