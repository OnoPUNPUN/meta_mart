import 'package:meta_mart/core/error/exceptions.dart';
import 'package:meta_mart/core/network/api_client.dart';
import 'package:meta_mart/features/search/data/datasources/category_remote_data_source.dart';
import 'package:meta_mart/features/search/data/models/category_model.dart';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final ApiClient apiClient;

  CategoryRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<CategoryModel>> getCategoris() async {
    final response = await apiClient.get('/categories');

    if (response.statusCode == 200) {
      final data = response.data as List<dynamic>;

      return data
          .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
          .toList();
    }
    throw ServerException(message: 'Failed to fetch categories');
  }
}
