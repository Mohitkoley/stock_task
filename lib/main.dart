import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_task/core/di/service_locator.dart';
import 'package:stock_task/features/auth/repositories/auth_repo.dart';
import 'package:stock_task/firebase_options.dart';
import 'package:stock_task/my_app.dart';
import 'features/auth/controllers/auth_controller.dart';
import 'features/dashboard/controllers/dashboard_controller.dart';

Future main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    ServiceLocator().setup();

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) =>
                AuthController(ServiceLocator.getIt<AuthRepository>()),
          ),
          ChangeNotifierProvider(create: (_) => DashboardController()),
        ],
        child: MyApp(),
      ),
    );
  }, catchUnhandledExceptions);
}

void catchUnhandledExceptions(Object error, StackTrace? stack) {
  FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  debugPrintStack(stackTrace: stack, label: error.toString());
}
