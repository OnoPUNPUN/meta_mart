import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:meta_mart/core/error/exceptions.dart';
import 'package:meta_mart/core/error/failures.dart';
import 'package:meta_mart/features/search/data/datasources/category_remote_data_source.dart';
import 'package:meta_mart/features/search/data/repositories/category_repository.dart';
import 'package:meta_mart/features/search/domain/entities/category.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Category>>> getCategory() async {
    try {
      final categories = await remoteDataSource.getCategoris();
      return right(categories);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? 'Network error'));
    } catch (_) {
      return left(const ServerFailure('Something went wrong'));
    }
  }
}
