import 'package:fpdart/fpdart.dart';
import 'package:meta_mart/core/error/failures.dart';
import 'package:meta_mart/core/usecase/usecase.dart';
import 'package:meta_mart/features/home/domain/entities/product.dart';
import 'package:meta_mart/features/home/domain/repositories/product_repository.dart';

class GetProductsUsecase implements Usecase<List<Product>, GetProductParams> {
  final ProductRepository repository;

  GetProductsUsecase(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(GetProductParams params) async {
    return repository.getProducts(offset: params.offset, limit: params.limit);
  }
}

class GetProductParams {
  final int offset;
  final int limit;

  GetProductParams({required this.offset, required this.limit});
}
