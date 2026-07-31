import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:meta_mart/core/network/api_client.dart';
import 'package:meta_mart/core/network/dio_provider.dart';
import 'package:meta_mart/core/network/token_manager.dart';
import 'package:meta_mart/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:meta_mart/features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:meta_mart/features/auth/domain/repositories/auth_repository.dart';
import 'package:meta_mart/features/auth/domain/repositories/auth_repository_impl.dart';
import 'package:meta_mart/features/auth/domain/usecases/login_usecase.dart';
import 'package:meta_mart/features/auth/domain/usecases/register_usecase.dart';
import 'package:meta_mart/features/auth/presentation/bloc/auth_bloc.dart';

part 'init_dependencies.main.dart';
