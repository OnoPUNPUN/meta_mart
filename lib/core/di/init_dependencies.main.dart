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

  // Get All Products
  serviceProvider.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(serviceProvider()),
  );

  serviceProvider.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(serviceProvider()),
  );

  serviceProvider.registerLazySingleton(
    () => GetProductsUsecase(serviceProvider()),
  );

  serviceProvider.registerFactory(() => HomeBloc(serviceProvider()));

  // Get all Categories
  serviceProvider.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(serviceProvider()),
  );

  serviceProvider.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(remoteDataSource: serviceProvider()),
  );

  serviceProvider.registerLazySingleton(
    () => GetCategoriesUsecase(serviceProvider()),
  );

  serviceProvider.registerFactory(() => SearchBloc(serviceProvider()));
}
