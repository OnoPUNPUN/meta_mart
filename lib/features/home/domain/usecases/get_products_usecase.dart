import 'package:fpdart/fpdart.dart';
import 'package:meta_mart/core/error/failures.dart';
import 'package:meta_mart/core/usecase/usecase.dart';
import 'package:meta_mart/features/home/domain/entities/product.dart';
import 'package:meta_mart/features/home/domain/repositories/product_repository.dart';

class GetProductsUsecase implements Usecase<List<Product>, NoParams> {
  final ProductRepository repository;

  GetProductsUsecase(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return repository.getProducts();
  }
}
