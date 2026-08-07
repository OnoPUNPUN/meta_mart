import 'package:fpdart/fpdart.dart';
import 'package:meta_mart/core/error/failures.dart';
import 'package:meta_mart/features/search/domain/entities/category.dart';

abstract interface class CategoryRepository {
  Future<Either<Failure, List<Category>>> getCategory();
}
