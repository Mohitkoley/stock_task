import 'package:flutter/material.dart';
import 'package:stock_task/core/theme/color_palette.dart';

enum Status { inProgress, complete, pending, approved, rejected }

extension OrderStatusExtension on Status {
  String get displayName {
    switch (this) {
      case Status.inProgress:
        return "In Progress";
      case Status.complete:
        return "Complete";
      case Status.pending:
        return "Pending";
      case Status.approved:
        return "Approved";
      case Status.rejected:
        return "Rejected";
    }
  }

  Color get color {
    switch (this) {
      case Status.inProgress:
        return Colors.deepPurple;
      case Status.complete:
        return Colors.green;
      case Status.pending:
        return Colors.blue;
      case Status.approved:
        return Colors.yellow;
      case Status.rejected:
        return ColorPalette.textColor;
    }
  }
}
