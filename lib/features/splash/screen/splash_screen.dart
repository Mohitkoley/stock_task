import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stock_task/core/router/app_router.gr.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.router.push(LoginRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
