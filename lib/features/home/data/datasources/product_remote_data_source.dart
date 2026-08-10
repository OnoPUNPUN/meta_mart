import 'package:meta_mart/features/home/data/models/product_model.dart';

abstract interface class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts({
    required int offset,
    required int limit,
  });

  Future<List<ProductModel>> filterProducts({
    required int categoryId,
    required String categorySlug,
  });
}
