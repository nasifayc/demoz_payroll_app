import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final int maleCount;
  final int femaleCount;

  const Chart({
    super.key,
    required this.maleCount,
    required this.femaleCount,
  });

  @override
  Widget build(BuildContext context) {
    int total = maleCount + femaleCount;

    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            color: const Color(0xFF16C098),
            value: maleCount.toDouble(),
            title: '${(maleCount / total * 100).toStringAsFixed(1)}%',
            radius: 20,
            titleStyle: const TextStyle(
              fontSize: 18,
              backgroundColor: Colors.white,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          PieChartSectionData(
            color: const Color(0xFF5932EA),
            value: femaleCount.toDouble(),
            title: '${(femaleCount / total * 100).toStringAsFixed(1)}%',
            radius: 25,
            titleStyle: const TextStyle(
              fontSize: 18,
              backgroundColor: Colors.white,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
        sectionsSpace: 0,
        centerSpaceRadius: 30,
      ),
    );
  }
}
