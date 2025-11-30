// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:common_extension/context_extension/context_ext.dart';

import 'package:flutter/material.dart';

import 'package:stock_task/features/dashboard/models/project_model.dart';
import 'package:stock_task/features/dashboard/models/status_enum.dart';

class ProjectListWidget extends StatelessWidget {
  const ProjectListWidget({
    super.key,
    required this.backgroundColor,
    required this.project,
  });
  final Color backgroundColor;
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blueAccent,
                child: Text(
                  project.name[0],
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                project.name,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: project.status.color.withAlpha(80),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              project.status.displayName,
              style: context.textTheme.bodyMedium?.copyWith(
                color: project.status.color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
