import 'package:flutter/material.dart';
import 'package:meta_mart/core/theme/app_colors.dart';

class AuthPageShell extends StatelessWidget {
  const AuthPageShell({
    super.key,
    required this.title,
    required this.subtitle,
    required this.children,
  });

  final String title;
  final String subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
          children: [
            const _AuthBrandMark(),
            const SizedBox(height: 42),
            Text(title, style: textTheme.displayLarge),
            const SizedBox(height: 10),
            Text(
              subtitle,
              style: textTheme.bodyLarge?.copyWith(
                color: AppColors.contentSecondary,
              ),
            ),
            const SizedBox(height: 32),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _AuthBrandMark extends StatelessWidget {
  const _AuthBrandMark();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.contentPrimary,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.shopping_bag_outlined,
            color: AppColors.contentOnColor,
            size: 22,
          ),
        ),
        const SizedBox(width: 12),
        Text('MetaMart', style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
