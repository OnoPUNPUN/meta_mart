import 'package:meta_mart/core/error/exceptions.dart';
import 'package:meta_mart/core/network/api_client.dart';
import 'package:meta_mart/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:meta_mart/features/auth/data/models/auth_tokens_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl(this.apiClient);

  @override
  Future<AuthTokensModel> login({
    required String email,
    required String password,
  }) async {
    final response = await apiClient.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return AuthTokensModel.fromJson(response.data as Map<String, dynamic>);
    }

    throw ServerException(message: "Login Failed");
  }

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String avatar,
  }) async {
    final response = await apiClient.post(
      '/users',
      data: {
        'name': name,
        'email': email,
        'password': password,
        'avatar': avatar,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return;
    }

    throw ServerException(message: "Registration Failed");
  }
}
