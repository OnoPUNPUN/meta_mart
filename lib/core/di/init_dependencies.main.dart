part of 'init_dependencies.dart';

final serviceProvider = GetIt.instance;
Future<void> init() async {
  serviceProvider.registerLazySingleton(() => const FlutterSecureStorage());

  serviceProvider.registerLazySingleton(() => TokenManager(serviceProvider()));

  serviceProvider.registerLazySingleton(
    () => DioProvider.createDio(serviceProvider()),
  );

  serviceProvider.registerLazySingleton(() => ApiClient(serviceProvider()));

  serviceProvider.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(serviceProvider()),
  );

  serviceProvider.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: serviceProvider(),
      tokenManager: serviceProvider(),
    ),
  );

  serviceProvider.registerLazySingleton(() => LoginUsecase(serviceProvider()));
  serviceProvider.registerLazySingleton(
    () => RegisterUsecase(serviceProvider()),
  );

  serviceProvider.registerFactory(
    () => AuthBloc(
      loginUsecase: serviceProvider(),
      registerUsecase: serviceProvider(),
    ),
  );
}
