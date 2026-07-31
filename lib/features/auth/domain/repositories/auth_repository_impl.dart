import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:meta_mart/core/error/exceptions.dart';
import 'package:meta_mart/core/error/failures.dart';
import 'package:meta_mart/core/network/token_manager.dart';
import 'package:meta_mart/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:meta_mart/features/auth/domain/entities/auth_tokens.dart';
import 'package:meta_mart/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final TokenManager tokenManager;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.tokenManager,
  });

  @override
  Future<Either<Failure, AuthTokens>> login({
    required String email,
    required String password,
  }) async {
    try {
      final tokens = await authRemoteDataSource.login(
        email: email,
        password: password,
      );

      await tokenManager.saveAuthTokens(
        accessToken: tokens.accessToken,
        refreshToken: tokens.refreshToken,
      );

      return right(tokens);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? "Network error"));
    } catch (_) {
      return left(const ServerFailure("Something Went Wrong"));
    }
  }

  @override
  Future<Either<Failure, Unit>> register({
    required String name,
    required String email,
    required String password,
    required String avatar,
  }) async {
    try {
      await authRemoteDataSource.register(
        name: name,
        email: email,
        password: password,
        avatar: avatar,
      );

      return right(unit);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? "Network error"));
    } catch (_) {
      return left(const ServerFailure("Something Went Wrong"));
    }
  }
}
