import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/terms.dart';

abstract class TermsRepository {
  Future<Either<Failure, List<Terms>>> getTermsData();
}
