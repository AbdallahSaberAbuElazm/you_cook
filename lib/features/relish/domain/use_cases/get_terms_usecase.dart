import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/terms.dart';
import 'package:you_cook/features/relish/domain/repositories/terms_repository.dart';

class GetTermsUsecase {
  final TermsRepository termsRepository;

  GetTermsUsecase(this.termsRepository);

  Future<Either<Failure, List<Terms>>> call() async {
    return await termsRepository.getTermsData();
  }
}
