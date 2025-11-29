// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:stock_task/features/auth/screens/login_screen.dart' as _i2;
import 'package:stock_task/features/dashboard/screens/dashboard_screen.dart'
    as _i1;
import 'package:stock_task/features/dashboard/screens/order_list_screen.dart'
    as _i3;
import 'package:stock_task/features/dashboard/screens/user_info_screen.dart'
    as _i5;
import 'package:stock_task/features/splash/screen/splash_screen.dart' as _i4;

/// generated route for
/// [_i1.DashboardScreen]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute({List<_i6.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginScreen();
    },
  );
}

/// generated route for
/// [_i3.OrderListScreen]
class OrderListRoute extends _i6.PageRouteInfo<void> {
  const OrderListRoute({List<_i6.PageRouteInfo>? children})
    : super(OrderListRoute.name, initialChildren: children);

  static const String name = 'OrderListRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.OrderListScreen();
    },
  );
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashScreen();
    },
  );
}

/// generated route for
/// [_i5.UserInfoScreen]
class UserInfoRoute extends _i6.PageRouteInfo<void> {
  const UserInfoRoute({List<_i6.PageRouteInfo>? children})
    : super(UserInfoRoute.name, initialChildren: children);

  static const String name = 'UserInfoRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.UserInfoScreen();
    },
  );
}
