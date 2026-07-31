import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_mart/features/auth/domain/usecases/login_usecase.dart';
import 'package:meta_mart/features/auth/domain/usecases/register_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;
  AuthBloc({required this.loginUsecase, required this.registerUsecase})
    : super(AuthInitial()) {
    on<LoginEvent>(_onLoginEvent);
    on<RegisterEvent>(_onRegisterEvent);
  }

  Future<void> _onLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    final result = await loginUsecase(
      LoginParams(email: event.email, password: event.password),
    );

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (_) => emit(AuthSuccess()),
    );
  }

  Future<void> _onRegisterEvent(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await registerUsecase(
      RegisterParams(
        name: event.name,
        email: event.email,
        password: event.password,
        avatar: event.avatar,
      ),
    );

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (_) => emit(AuthRegisterSuccess()),
    );
  }
}
