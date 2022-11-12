import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/privacy.dart';
import 'package:you_cook/features/relish/domain/repositories/privacy_repository.dart';

class GetPrivacyUsecase {
  final PrivacyRepository privacyRepository;

  GetPrivacyUsecase(this.privacyRepository);

  Future<Either<Failure, List<Privacy>>> call() async {
    return await privacyRepository.getPrivacyData();
  }
}
