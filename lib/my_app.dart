import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_task/core/router/app_router.dart';
import 'package:stock_task/core/router/observer/print_route_observer.dart';
import 'package:stock_task/core/theme/color_palette.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Stock Task',
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [PrintRouteObserver()],
      ),
      theme:
          ThemeData.dark(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a purple toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
          ).copyWith(
            colorScheme: .fromSeed(seedColor: ColorPalette.primary),
            scaffoldBackgroundColor: ColorPalette.scaffoldBackground,
            appBarTheme: AppBarThemeData(
              foregroundColor: ColorPalette.primary,
              backgroundColor: ColorPalette.scaffoldBackground,
            ),
          ),
    );
  }
}
