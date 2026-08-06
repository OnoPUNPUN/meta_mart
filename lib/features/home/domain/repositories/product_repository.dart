import 'package:fpdart/fpdart.dart';
import 'package:meta_mart/core/error/failures.dart';
import 'package:meta_mart/features/home/domain/entities/product.dart';

abstract interface class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts({
    required int offset,
    required int limit,
  });
}
