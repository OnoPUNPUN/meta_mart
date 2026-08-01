import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:meta_mart/core/error/exceptions.dart';
import 'package:meta_mart/core/error/failures.dart';
import 'package:meta_mart/features/home/data/datasources/product_remote_data_source.dart';
import 'package:meta_mart/features/home/domain/entities/product.dart';
import 'package:meta_mart/features/home/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final products = await remoteDataSource.getProducts();

      return right(products);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? 'Network error'));
    } catch (_) {
      return left(const ServerFailure('Something went wrong'));
    }
  }
}
