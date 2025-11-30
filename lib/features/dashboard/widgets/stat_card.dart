import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stock_task/features/dashboard/models/stat_card_model.dart';

class StatCard extends StatelessWidget {
  final StatCardModel data;

  const StatCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: data.isBlue
            ? const LinearGradient(
                colors: [Color(0xff4C9BFF), Color(0xff267BFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : const LinearGradient(
                colors: [Color(0xff3A3A3A), Color(0xff2B2B2B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: .spaceEvenly,
        children: [
          // ---- TITLE ROW ----
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.title,
                style: TextStyle(
                  color: data.isBlue ? Colors.white : Colors.white70,
                  fontSize: 15,
                ),
              ),

              // Small circle icon
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(70),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  data.isPositive
                      ? Ionicons.trending_up_outline
                      : Ionicons.trending_down_outline,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                data.value,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                data.changePercent,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
