import 'dart:async';

import 'package:boilerplate/domain/repository/user/user_repository.dart';
import 'package:boilerplate/domain/usecase/user/delete_user_usecase.dart';
import 'package:boilerplate/domain/usecase/user/find_user_by_id_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_user_usecase.dart';
import 'package:boilerplate/domain/usecase/user/insert_user_usecase.dart';
import 'package:boilerplate/domain/usecase/user/udpate_user_usecase.dart';

import '../../../di/service_locator.dart';

mixin UseCaseModule {
  static Future<void> configureUseCaseModuleInjection() async {
    // post:--------------------------------------------------------------------
    getIt.registerSingleton<GetUserUseCase>(
      GetUserUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<FindUserByIdUseCase>(
      FindUserByIdUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<InsertUserUseCase>(
      InsertUserUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<UpdateUserUseCase>(
      UpdateUserUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<DeletePostUseCase>(
      DeletePostUseCase(getIt<UserRepository>()),
    );
  }
}
