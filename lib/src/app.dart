import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_mart/core/di/init_dependencies.dart';
import 'package:meta_mart/core/router/app_router.dart';
import 'package:meta_mart/core/theme/app_theme.dart';
import 'package:meta_mart/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:meta_mart/features/home/presentation/bloc/home_bloc.dart';

class MetaMart extends StatelessWidget {
  const MetaMart({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => serviceProvider<AuthBloc>(),
        ),
        BlocProvider(create: (context) => serviceProvider<HomeBloc>()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        title: "Meta Mart",
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
