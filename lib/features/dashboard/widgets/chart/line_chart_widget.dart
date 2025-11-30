import 'package:common_extension/index.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stock_task/core/theme/color_palette.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  final spots = const [
    FlSpot(0, 4),
    FlSpot(1, 2),
    FlSpot(2, 3),
    FlSpot(3, 7),
    FlSpot(4, 5),
    FlSpot(5, 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorPalette.tileColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Users",
                    style: context.bodyMedium.copyWith(
                      color: Colors.purpleAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Projects",
                    style: context.bodyMedium.copyWith(
                      color: ColorPalette.textColor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Operating Status",
                    style: context.bodyMedium.copyWith(
                      color: ColorPalette.textColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              SizedBox(
                height: 150,
                child: LineChart(
                  LineChartData(
                    minX: 0,
                    maxX: 5,
                    minY: 0,
                    maxY: 10,

                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: false,
                      drawVerticalLine: true,
                      getDrawingVerticalLine: (value) {
                        // show only if this value is EXACTLY one of the spot x-values
                        bool shouldDraw = spots.any((s) => s.x == value);

                        return FlLine(
                          color: shouldDraw
                              ? Colors.white.withAlpha(20)
                              : Colors.transparent,
                          strokeWidth: 1,
                        );
                      },
                      verticalInterval: 1,
                    ),
                    borderData: FlBorderData(show: false),

                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          getTitlesWidget: (value, meta) {
                            const months = [
                              "Jan",
                              "Feb",
                              "Mar",
                              "Apr",
                              "May",
                              "Jun",
                            ];
                            return Text(
                              months[value.toInt()],
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,

                        isCurved: true,
                        curveSmoothness: 0.1, // <<< Less curve

                        color: Colors.purpleAccent,
                        barWidth: 2,
                        belowBarData: BarAreaData(show: false),

                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: 5.5,
                              color: Colors.white,
                              strokeWidth: 2,
                              strokeColor: Colors.black,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
