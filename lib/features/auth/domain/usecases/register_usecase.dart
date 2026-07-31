import 'package:fpdart/fpdart.dart';
import 'package:meta_mart/core/error/failures.dart';
import 'package:meta_mart/core/usecase/usecase.dart';
import 'package:meta_mart/features/auth/domain/repositories/auth_repository.dart';

class RegisterUsecase implements Usecase<Unit, RegisterParams> {
  final AuthRepository repository;

  RegisterUsecase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(RegisterParams params) {
    return repository.register(
      name: params.name,
      email: params.email,
      password: params.password,
      avatar: params.avatar,
    );
  }
}

class RegisterParams {
  final String name;
  final String email;
  final String password;
  final String avatar;

  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
    this.avatar = '',
  });
}
