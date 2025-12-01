import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProductTrafficBarChart extends StatelessWidget {
  const ProductTrafficBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Location Traffic",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),

        Row(
          children: [
            _legendDot(Colors.white),
            const Text("All  "),
            _legendDot(Colors.grey),
            const Text("SnowUI  "),
            _legendDot(Colors.red),
            const Text("Dashboard"),
          ],
        ),
        const SizedBox(height: 16),

        // ---------------- CHART ------------------------
        SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData: const FlTitlesData(show: false),
              barGroups: [
                _group(1, 60, 45, 30),
                _group(2, 70, 55, 40),
                _group(3, 75, 60, 55),
                _group(4, 80, 70, 60),
                _group(5, 85, 75, 65),
              ],
              maxY: 100,
            ),
          ),
        ),
      ],
    );
  }

  static BarChartGroupData _group(
    int x,
    double all,
    double snowui,
    double dashboard,
  ) {
    return BarChartGroupData(
      x: x,
      barsSpace: 6, // small vertical spacing
      barRods: [
        _rod(all, Colors.white),
        _rod(snowui, Colors.grey),
        _rod(dashboard, Colors.red),
      ],
    );
  }

  static BarChartRodData _rod(double value, Color color) {
    return BarChartRodData(
      toY: value,
      width: 8, // thin bar like screenshot
      borderRadius: BorderRadius.circular(20), // rounded
      color: color,
    );
  }

  static Widget _legendDot(Color color) {
    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade600),
      ),
    );
  }
}
