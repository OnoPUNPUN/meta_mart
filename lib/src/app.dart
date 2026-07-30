import 'package:flutter/material.dart';
import 'package:meta_mart/core/router/app_router.dart';
import 'package:meta_mart/core/theme/app_theme.dart';

class MetaMart extends StatelessWidget {
  const MetaMart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: "Meta Mart",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }
}
