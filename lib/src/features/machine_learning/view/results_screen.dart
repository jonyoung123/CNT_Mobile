import 'package:cnt_mobile/src/features/machine_learning/data/model/predict_response.dart';
import 'package:cnt_mobile/src/features/machine_learning/view/plots_screens.dart';
import 'package:cnt_mobile/src/utils/components/components.dart';
import 'package:cnt_mobile/src/utils/constants/constant.dart';
import 'package:cnt_mobile/src/utils/extensions/string_extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({
    super.key,
    required this.predictResponseData,
  });
  final PredictResponseData predictResponseData;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Prediction Results",
          style: AppTextStyle.appBarStyle,
        ),
        centerTitle: true,
        leading: const LeadingIcon(),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('11th, March 2024 - 11:30am'),
                        const Text('Parameters:', style: TextStyle(fontWeight: FontWeight.bold)),
                        const Text('Young Modulus of Elasticity, E = 1200GPa'),
                        Text('CNT Length, L = ${widget.predictResponseData.length}'),
                        Text('CNT Diameter, D = ${widget.predictResponseData.diameter}'),
                        Text('Velocity, V = ${widget.predictResponseData.velocity}'),
                        Text('Non-Local Parameter, e0a = ${widget.predictResponseData.nonLocalParam}'),
                        Text('Linear Elastic Foundation Parameter, k1 = ${widget.predictResponseData.linearFoundation}'),
                        Text('Non-Linear Elastic Foundation Parameter, k1 = ${widget.predictResponseData.nonLinearFoundation}'),
                        Text('Initial Displacemnent, q0 = ${widget.predictResponseData.initialDisp}'),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.visibility_off_outlined),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => PlotsScreens(predictResponseData: widget.predictResponseData)),
                    );
                  },
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width * 1.3,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    _buildGraph(
                      context,
                      widget.predictResponseData.data2d?.mode1?.time ?? [],
                      widget.predictResponseData.data2d?.mode1?.deflection ?? [],
                      "MODE 1",
                      AppColors.black200,
                    ),
                    _buildGraph(
                      context,
                      widget.predictResponseData.data2d?.mode2?.time ?? [],
                      widget.predictResponseData.data2d?.mode2?.deflection ?? [],
                      "MODE 2",
                      AppColors.brown100,
                    ),
                    _buildGraph(
                      context,
                      widget.predictResponseData.data2d?.mode3?.time ?? [],
                      widget.predictResponseData.data2d?.mode3?.deflection ?? [],
                      "MODE 3",
                      AppColors.gold100,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12)
          ],
        ),
      ),
    );
  }

  Widget _buildGraph(context, xValues, yValues, title, lineColor) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, top: 20, left: 12),
      child: SizedBox(
        height: 300,
        width: MediaQuery.of(context).size.width * 1.2,
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: _getSpots(xValues, yValues),
                isCurved: false,
                color: lineColor,
                barWidth: 1,
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.transparent,
                  cutOffY: 10,
                  applyCutOffY: true,
                  // spotsLine: BarAreaSpotsLine(flLineStyle: FlLine(strokeWidth: 1, color: lineColor), show: true),
                ),
              ),
            ],
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(sideTitles: const SideTitles(showTitles: true, reservedSize: 60), axisNameWidget: "Deflection (m)".textStyled()),
              bottomTitles: AxisTitles(sideTitles: const SideTitles(showTitles: true), axisNameWidget: "Time (t)".textStyled()),
              topTitles: AxisTitles(sideTitles: const SideTitles(showTitles: true), axisNameWidget: title.toString().textStyled()),
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(show: true),
            gridData: const FlGridData(show: true, drawHorizontalLine: false, drawVerticalLine: false),
          ),
        ),
      ),
    );
  }

  List<FlSpot> _getSpots(xValues, yValues) {
    return List.generate(xValues.length, (index) {
      return FlSpot(xValues[index], yValues[index]);
    });
  }
}
