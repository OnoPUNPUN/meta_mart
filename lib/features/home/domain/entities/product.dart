import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final int price;
  final String description;
  final String categoryName;
  final String imageUrl;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.categoryName,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    price,
    description,
    categoryName,
    imageUrl,
  ];
}
