import 'package:meta_mart/features/home/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.categoryName,
    required super.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final images = json['images'] as List<dynamic>? ?? [];
    final category = json['category'] as Map<String, dynamic>?;

    return ProductModel(
      id: json['id'] as int,
      title: json['title'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      categoryName: category?['name'] as String? ?? '',
      imageUrl: images.isNotEmpty ? images.first.toString() : '',
    );
  }
}
