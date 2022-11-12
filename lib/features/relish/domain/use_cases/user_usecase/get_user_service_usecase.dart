import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/user_service.dart';
import 'package:you_cook/features/relish/domain/repositories/user_service_repository.dart';

class GetUserServiceUsecase {
  final UserServiceRepository userServiceRepository;

  GetUserServiceUsecase({
    required this.userServiceRepository,
  });

  Future<Either<Failure, UserService>> call(
      {required String accessToken}) async {
    return await userServiceRepository.getUserData(accessToken);
  }
}
