import 'package:fpdart/fpdart.dart';
import 'package:meta_mart/core/error/failures.dart';
import 'package:meta_mart/core/usecase/usecase.dart';
import 'package:meta_mart/features/search/data/repositories/category_repository.dart';
import 'package:meta_mart/features/search/domain/entities/category.dart';

class GetCategoriesUsecase implements Usecase<List<Category>, NoParams> {
  final CategoryRepository repository;

  GetCategoriesUsecase(this.repository);

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) {
    return repository.getCategory();
  }
}
