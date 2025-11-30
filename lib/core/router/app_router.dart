import 'package:auto_route/auto_route.dart';
import 'package:stock_task/core/router/app_router.gr.dart';

import 'route_names.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    RedirectRoute(path: '/', redirectTo: RouteNames.splash),
    AutoRoute(page: SplashRoute.page, path: RouteNames.splash, initial: true),
    AutoRoute(page: LoginRoute.page, path: RouteNames.login),
    AutoRoute(page: DashboardRoute.page, path: RouteNames.dashboard),
    AutoRoute(page: OrderListRoute.page, path: RouteNames.orderList),
    AutoRoute(page: UserInfoRoute.page, path: RouteNames.profile),
    AutoRoute(page: SmsOtpRoute.page, path: RouteNames.smsOtp),
  ];

  @override
  List<AutoRouteGuard> get guards => [];
}
