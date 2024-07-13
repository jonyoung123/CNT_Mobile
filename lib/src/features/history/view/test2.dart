import 'package:cnt_mobile/src/utils/components/components.dart';
import 'package:cnt_mobile/src/utils/constants/textstyle.dart';
import 'package:cnt_mobile/src/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'History',
            style: AppTextStyle.appBarStyle,
          ),
          centerTitle: true,
          leading: const LeadingIcon()),
      body: ListView(
        shrinkWrap: true,
        children: [
          _buildHistoryItem(context, isFirst: true),
          _buildHistoryItem(context),
          _buildHistoryItem(context, isLast: true),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(BuildContext context, {bool isFirst = false, bool isLast = false}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TimelineTile(
        alignment: TimelineAlign.start,
        lineXY: 0,
        isFirst: isFirst,
        isLast: isLast,
        indicatorStyle: const IndicatorStyle(
          width: 10,
          color: Colors.green,
          padding: EdgeInsets.all(6),
        ),
        beforeLineStyle: const LineStyle(
          color: Colors.green,
          thickness: 2,
        ),
        afterLineStyle: const LineStyle(
          color: Colors.green,
          thickness: 2,
        ),
        endChild: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('11th, March 2024 - 11:30am'),
                        Text('Parameters:', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Young Modulus of Elasticity, E = 200GPa'),
                        Text('Young Modulus of Elasticity, E = 200GPa'),
                        Text('Young Modulus of Elasticity, E = 200GPa'),
                        Text('Young Modulus of Elasticity, E = 200GPa'),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.download),
                    onPressed: () {
                      // Handle download action
                    },
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      _buildGraph(context),
                      _buildGraph(context),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGraph(context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 20),
      child: SizedBox(
        height: 300,
        width: MediaQuery.of(context).size.width * 0.9,
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: _getSpots(),
                isCurved: false,
                color: Colors.green,
                barWidth: 2,
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.green.withOpacity(0.3),
                ),
              ),
            ],
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(sideTitles: const SideTitles(showTitles: true), axisNameWidget: "Y-axis".textStyled()),
              bottomTitles: AxisTitles(sideTitles: const SideTitles(showTitles: true), axisNameWidget: "X-axis".textStyled()),
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(show: true),
            gridData: const FlGridData(show: true),
          ),
        ),
      ),
    );
  }

  List<FlSpot> _getSpots() {
    List<double> xValues = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    List<double> yValues = [3, 1, 2, 8, 4, 7, 2, 0, 6, 5];
    return List.generate(xValues.length, (index) {
      return FlSpot(xValues[index], yValues[index]);
    });
  }
}
