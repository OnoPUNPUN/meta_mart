import 'package:flutter/material.dart';
import 'package:meta_mart/core/theme/app_colors.dart';

class AuthSwitchPrompt extends StatelessWidget {
  const AuthSwitchPrompt({
    super.key,
    required this.text,
    required this.actionText,
    required this.onPressed,
  });

  final String text;
  final String actionText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            text,
            style: textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            actionText,
            style: textTheme.bodySmall?.copyWith(
              color: AppColors.contentPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
