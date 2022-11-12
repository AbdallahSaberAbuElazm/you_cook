import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/category.dart';
import 'package:you_cook/features/relish/domain/repositories/category_repository.dart';

class GetAllCategoryUsecase {
  final CategoryRepository categoryRepository;

  GetAllCategoryUsecase(this.categoryRepository);

  Future<Either<Failure, List<Category>>> call() async {
    return await categoryRepository.getAllCategories();
  }
}
