import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/kitchen.dart';
import 'package:you_cook/features/relish/domain/repositories/kitchen_repository.dart';

class GetAllKitchensUsecase {
  final KitchenRepository kitchenRepository;

  GetAllKitchensUsecase(this.kitchenRepository);

  Future<Either<Failure, List<Kitchen>>> call() async {
    return await kitchenRepository.getAllKitchens();
  }
}
