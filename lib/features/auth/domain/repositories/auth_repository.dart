import 'package:fpdart/fpdart.dart';
import 'package:meta_mart/core/error/failures.dart';
import 'package:meta_mart/features/auth/domain/entities/auth_tokens.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, AuthTokens>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> register({
    required String name,
    required String email,
    required String password,
    required String avatar,
  });
}
