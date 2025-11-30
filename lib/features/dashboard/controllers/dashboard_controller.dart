import 'package:flutter/material.dart';
import 'package:stock_task/features/dashboard/models/order_list/order_model.dart';
import 'package:stock_task/features/dashboard/models/project_model.dart';
import 'package:stock_task/features/dashboard/models/stat_card_model.dart';
import '../repositories/dashboard_repo.dart';

class DashboardController extends ChangeNotifier {
  final DashboardRepository _dashboardRepo = DashboardRepository();

  List<OrderModel> orders = [
    .new(
      orderId: "#CM9801",
      status: .inProgress,
      userName: "Natali Craig",
      projectName: "Landing Page",
      address: "Meadow Lane Oakland",
      orderDate: .now(), // "Just now"
    ),

    .new(
      orderId: "#CM9802",
      status: .complete,
      userName: "Kate Morrison",
      projectName: "CRM Admin pages",
      address: "Larry San Francisco",
      orderDate: .now().subtract(const Duration(minutes: 1)), // 1 min ago
    ),

    .new(
      orderId: "#CM9803",
      status: .pending,
      userName: "Drew Cano",
      projectName: "Client Project",
      address: "Bagwell Avenue Ocala",
      orderDate: .now().subtract(const Duration(hours: 1)), // 1 hour ago
    ),

    .new(
      orderId: "#CM9804",
      status: .approved,
      userName: "Orlando Diggs",
      projectName: "Admin Dashboard",
      address: "Washburn Baton Rouge",
      orderDate: .now().subtract(const Duration(days: 1)), // Yesterday
    ),

    .new(
      orderId: "#CM9805",
      status: .rejected,
      userName: "Andi Lane",
      projectName: "App Landing Page",
      address: "Nest Lane Olivette",
      orderDate: DateTime(2024, 2, 2),
    ),
  ];

  List<ProjectModel> projects = [
    .new(name: "ByeWind", status: .inProgress),
    .new(name: "Ntali Craig", status: .complete),
    .new(name: "Drew Cano", status: .pending),
    .new(name: "Orlando Diggs", status: .approved),
    .new(name: "Andi Lane", status: .rejected),
  ];

  List<StatCardModel> stats = [
    .new(
      title: "Views",
      value: "7,265",
      changePercent: "+11.01%",
      isPositive: true,
      isBlue: true,
    ),
    .new(
      title: "Visits",
      value: "3,671",
      changePercent: "-0.03%",
      isPositive: false,
      isBlue: false,
    ),
    .new(
      title: "New Users",
      value: "256",
      changePercent: "+15.03%",
      isPositive: true,
      isBlue: false,
    ),
    .new(
      title: "Active Users",
      value: "2,318",
      changePercent: "+6.08%",
      isPositive: true,
      isBlue: true,
    ),
  ];
}
