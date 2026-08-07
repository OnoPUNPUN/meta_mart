import 'package:meta_mart/features/search/data/models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategoris();
}
