import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/repositories/user_service_repository.dart';

class LogoutUserServiceUsecase {
  final UserServiceRepository userServiceRepository;

  LogoutUserServiceUsecase({
    required this.userServiceRepository,
  });

  Future<Either<Failure, Unit>> call({required String accessToken}) async {
    return await userServiceRepository.logoutUser(accessToken);
  }
}
