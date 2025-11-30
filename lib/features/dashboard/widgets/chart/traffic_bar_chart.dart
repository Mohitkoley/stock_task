import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stock_task/core/theme/color_palette.dart';

class TrafficBarChart extends StatefulWidget {
  final String title;
  final Color titleColor;
  final List<String> labels;
  final List<double> values;
  final Gradient highlightGradient;
  final Color normalBarColor;

  const TrafficBarChart({
    super.key,
    required this.title,
    required this.titleColor,
    required this.labels,
    required this.values,
    required this.highlightGradient,
    this.normalBarColor = ColorPalette.textColor,
  });

  @override
  State<TrafficBarChart> createState() => _TrafficBarChartState();
}

class _TrafficBarChartState extends State<TrafficBarChart> {
  int? selectedIndex;

  // Optional: automatic scaling so bars fit nicely in the chart.
  double get _maxValue {
    if (widget.values.isEmpty) return 1;
    return widget.values.reduce((a, b) => a > b ? a : b);
  }

  /// Convert actual value to a chart-friendly y (so tall values don't overflow).
  double _toChartY(double value) {
    final chartMax = _maxValue * 1.1;
    if (chartMax == 0) return 0;
    return value.clamp(0, chartMax);
  }

  String _formatValue(double val) {
    if (val >= 1000000) return "${(val / 1000000).toStringAsFixed(1)}M";
    if (val >= 1000) return "${(val / 1000).toStringAsFixed(0)}K";
    return val.toInt().toString();
  }

  @override
  Widget build(BuildContext context) {
    final chartMax = (_maxValue * 1.1).clamp(1.0, double.infinity);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: ColorPalette.tileColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            widget.title,
            style: TextStyle(
              color: widget.titleColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 220,
            child: BarChart(
              BarChartData(
                maxY: chartMax,
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),

                // ---------------- Touch / Selection & Tooltip -----------------
                barTouchData: BarTouchData(
                  enabled: true,
                  handleBuiltInTouches: false,
                  touchCallback: (event, response) {
                    // If user taps outside or release with no spot, clear selection
                    if (!event.isInterestedForInteractions ||
                        response?.spot == null) {
                      setState(() => selectedIndex = null);
                      return;
                    }
                    setState(
                      () =>
                          selectedIndex = response!.spot!.touchedBarGroupIndex,
                    );
                  },

                  // Proper tooltip config
                  touchTooltipData: BarTouchTooltipData(
                    tooltipPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),

                    fitInsideHorizontally: true,
                    fitInsideVertically: true,

                    // Build the tooltip item for the touched group
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      final int idx = group.x.toInt();
                      if (idx < 0 || idx >= widget.values.length) return null;
                      final actualValue = widget.values[idx];
                      final formatted = _formatValue(actualValue);
                      return BarTooltipItem(
                        formatted,
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      );
                    },
                  ),
                ),

                // ---------------- Axis Titles ------------------------
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final i = value.toInt();
                        if (i < 0 || i >= widget.labels.length) {
                          return const SizedBox();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            widget.labels[i],
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // ---------------- Bars ------------------------
                barGroups: List.generate(widget.labels.length, (i) {
                  final isSelected = selectedIndex == i;
                  final toY = _toChartY(widget.values[i]);

                  return BarChartGroupData(
                    x: i,
                    barsSpace: 12,
                    barRods: [
                      BarChartRodData(
                        toY: toY,
                        width: 30,
                        borderRadius: BorderRadius.circular(8),

                        // Selected gradient
                        gradient: isSelected ? widget.highlightGradient : null,

                        // Normal color
                        color: isSelected
                            ? null
                            : widget.normalBarColor.withAlpha(35),
                      ),
                    ],
                    // show tooltip indicator only for selected group
                    showingTooltipIndicators: isSelected ? [0] : const [],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
