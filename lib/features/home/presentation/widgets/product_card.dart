import 'package:flutter/material.dart';
import 'package:meta_mart/core/theme/app_colors.dart';
import 'package:meta_mart/core/theme/app_theme.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final int price;
  final String title;
  final String subtitle;
  final VoidCallback? onFavouriteTap;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.price,
    required this.title,
    required this.subtitle,
    this.onFavouriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 170,
                width: 160,
                decoration: BoxDecoration(
                  color: AppColors.backgroundSecondary,
                  borderRadius: BorderRadius.circular(24),
                ),
                alignment: Alignment.center,
                child: Image.network(
                  imagePath,
                  width: 112,
                  height: 119,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$price Tk", style: AppTheme.productPrice()),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 16 / 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.contentPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        height: 12 / 10,
                        fontWeight: FontWeight.w400,
                        color: AppColors.contentSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: InkWell(
              onTap: onFavouriteTap,
              borderRadius: BorderRadius.circular(23),
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: AppColors.backgroundPrimary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite_border,
                  size: 14,
                  color: AppColors.contentPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
