import 'package:cnt_mobile/src/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHistoryItem(context),
            _buildHistoryItem(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('11th, March 2024 - 11:30am'),
              subtitle: Column(
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
            ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildGraph(),
                _buildGraph(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGraph() {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
              leftTitles: AxisTitles(
                  sideTitles: const SideTitles(
                    showTitles: true,
                  ),
                  axisNameWidget: "X-AXIS".textStyled()),
              bottomTitles: AxisTitles(
                  sideTitles: const SideTitles(
                    showTitles: true,
                  ),
                  axisNameWidget: "Y-AXIS".textStyled()),
            ),
            borderData: FlBorderData(show: true),
            gridData: const FlGridData(show: true),
          ),
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
