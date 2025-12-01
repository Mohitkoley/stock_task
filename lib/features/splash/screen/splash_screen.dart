import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stock_task/core/router/app_router.gr.dart';
import 'package:stock_task/core/service/storage_service.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  StorageService storageService = StorageService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (storageService.isLoggedIn()) {
      context.replaceRoute(const DashboardRoute());
    } else {
      context.replaceRoute(const LoginRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
