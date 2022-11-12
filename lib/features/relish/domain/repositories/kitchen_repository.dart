import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/kitchen.dart';

abstract class KitchenRepository {
  Future<Either<Failure, List<Kitchen>>> getAllKitchens();
}
