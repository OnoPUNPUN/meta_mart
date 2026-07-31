import 'package:meta_mart/features/auth/data/models/auth_tokens_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthTokensModel> login({
    required String email,
    required String password,
  });

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String avatar,
  });
}
