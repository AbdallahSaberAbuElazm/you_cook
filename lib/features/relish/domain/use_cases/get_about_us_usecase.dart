import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/about_us.dart';
import 'package:you_cook/features/relish/domain/repositories/about_us_repository.dart';

class GetAboutUsUsecase {
  final AboutUsRepository aboutUsRepository;

  GetAboutUsUsecase(this.aboutUsRepository);

  Future<Either<Failure, List<AboutUs>>> call() async {
    return await aboutUsRepository.getAboutUsData();
  }
}
