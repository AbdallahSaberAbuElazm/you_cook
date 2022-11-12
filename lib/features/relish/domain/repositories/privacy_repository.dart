import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/privacy.dart';

abstract class PrivacyRepository {
  Future<Either<Failure, List<Privacy>>> getPrivacyData();
}
