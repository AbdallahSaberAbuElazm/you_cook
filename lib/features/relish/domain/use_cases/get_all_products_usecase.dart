import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/product.dart';
import 'package:you_cook/features/relish/domain/repositories/product_repository.dart';

class GetAllProductsUsecase {
  final ProductRepository foodRepository;
  GetAllProductsUsecase(this.foodRepository);

  Future<Either<Failure, List<Product>>> call() async {
    return await foodRepository.getAllProducts();
  }
}
