import 'package:fpdart/fpdart.dart';
import 'package:meta_mart/core/error/failures.dart';
import 'package:meta_mart/core/usecase/usecase.dart';
import 'package:meta_mart/features/auth/domain/entities/auth_tokens.dart';
import 'package:meta_mart/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase implements Usecase<AuthTokens, LoginParams> {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, AuthTokens>> call(LoginParams params) {
    return repository.login(email: params.email, password: params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});
}
