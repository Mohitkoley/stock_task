import 'package:get_it/get_it.dart';
import 'package:stock_task/core/router/app_router.dart';
import 'package:stock_task/features/auth/repositories/auth_repo.dart';

class ServiceLocator {
  ServiceLocator._();

  static ServiceLocator instance = ServiceLocator._();

  factory ServiceLocator() => instance;

  static final _getIt = GetIt.instance;

  static GetIt get getIt => _getIt;

  void setup() {
    getIt.registerSingleton<AuthRepository>(AuthRepository());
    getIt.registerSingleton<AppRouter>(AppRouter());
  }
}
