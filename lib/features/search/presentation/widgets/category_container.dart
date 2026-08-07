import 'package:flutter/material.dart';
import 'package:meta_mart/core/theme/app_colors.dart';

class CategoryContainer extends StatelessWidget {
  final String categoryName;
  const CategoryContainer({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(color: AppColors.contentDisabled),
        ),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(
            categoryName,
            style: textTheme.headlineMedium,
            overflow: TextOverflow.ellipsis,
          ),
          Icon(Icons.arrow_right_alt, size: 28),
        ],
      ),
    );
  }
}
