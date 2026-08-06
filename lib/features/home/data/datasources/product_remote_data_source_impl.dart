import 'package:meta_mart/core/error/exceptions.dart';
import 'package:meta_mart/core/network/api_client.dart';
import 'package:meta_mart/features/home/data/datasources/product_remote_data_source.dart';
import 'package:meta_mart/features/home/data/models/product_model.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiClient apiClient;

  ProductRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<ProductModel>> getProducts({
    required int offset,
    required int limit,
  }) async {
    final response = await apiClient.get(
      '/products',
      queryParameters: {'offset': offset, 'limit': limit},
    );

    if (response.statusCode == 200) {
      final data = response.data as List<dynamic>;

      return data
          .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
          .toList();
    }

    throw ServerException(message: "Failed to fetch products");
  }
}
