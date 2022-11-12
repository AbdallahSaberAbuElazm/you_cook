import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/about_us.dart';

abstract class AboutUsRepository {
  Future<Either<Failure, List<AboutUs>>> getAboutUsData();
}
