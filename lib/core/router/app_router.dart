import 'package:go_router/go_router.dart';
import 'package:meta_mart/features/auth/presentation/pages/login_page.dart';
import 'package:meta_mart/features/auth/presentation/pages/singup_page.dart';

class AppRouter {
  const AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: LoginPage.name,
    routes: [
      GoRoute(
        path: LoginPage.name,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: SingupPage.name,
        builder: (context, state) => const SingupPage(),
      ),
    ],
  );
}
