import 'package:flutter/material.dart';
import 'package:stock_task/features/dashboard/models/order_list/order_model.dart';
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
}
