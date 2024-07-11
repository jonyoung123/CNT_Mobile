import 'package:cnt_mobile/src/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HistoryScreens extends StatelessWidget {
  const HistoryScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
      padding: EdgeInsets.all(10),
      child: TimelineTile(
        alignment: TimelineAlign.start,
        lineXY: 0,
        isFirst: isFirst,
        isLast: isLast,
        indicatorStyle: IndicatorStyle(
          width: 10,
          color: Colors.green,
          padding: EdgeInsets.all(6),
        ),
        beforeLineStyle: LineStyle(
          color: Colors.green,
          thickness: 2,
        ),
        afterLineStyle: LineStyle(
          color: Colors.green,
          thickness: 2,
        ),
        endChild: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text('11th, March 2024 - 11:30am'),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Parameters:', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Young Modulus of Elasticity, E = 200GPa'),
                      Text('Young Modulus of Elasticity, E = 200GPa'),
                      Text('Young Modulus of Elasticity, E = 200GPa'),
                      Text('Young Modulus of Elasticity, E = 200GPa'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.download),
                    onPressed: () {
                      // Handle download action
                    },
                  ),
                ),
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
    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width * 0.9,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: _getSpots(),
              isCurved: true,
              color: Colors.green,
              barWidth: 2,
              belowBarData: BarAreaData(
                show: true,
                color: Colors.green.withOpacity(0.3),
              ),
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true), axisNameWidget: "Y-axis".textStyled()),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true), axisNameWidget: "X-axis".textStyled()),
          ),
          borderData: FlBorderData(show: true),
          gridData: FlGridData(show: true),
        ),
      ),
    );
  }

  List<FlSpot> _getSpots() {
    List<double> xValues = [0, 1, 2, 3, 4, 5, 6, 7];
    List<double> yValues = [0, 1, 2, 3, 4, 5, 6, 7];
    return List.generate(xValues.length, (index) {
      return FlSpot(xValues[index], yValues[index]);
    });
  }
}
