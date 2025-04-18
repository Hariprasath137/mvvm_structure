// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_structure_reference/features/blood_pressure/data/model/blood_pressure_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BpChart extends StatelessWidget {
  final List<BpChartData> chartData;
  const BpChart({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                majorTickLines: const MajorTickLines(
                  size: 8,
                  color: Colors.black,
                ),
                labelPlacement: LabelPlacement.onTicks,
                edgeLabelPlacement: EdgeLabelPlacement.none,
                labelRotation: 0,
                majorGridLines: const MajorGridLines(
                  width: 1,
                  color: Color(0XFFCCCCCC),
                ),
                axisLine: const AxisLine(color: Colors.black, width: 1),
              ),
              primaryYAxis: NumericAxis(
                minimum: 60,
                maximum: 140,
                interval: 20,
                majorTickLines: const MajorTickLines(
                  size: 8,
                  color: Colors.black,
                ),
                majorGridLines: const MajorGridLines(
                  width: 1,
                  color: Color(0XFFCCCCCC),
                ),
                axisLine: const AxisLine(color: Colors.black, width: 1),
              ),
              series: <CartesianSeries>[
                SplineSeries<BpChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (BpChartData data, _) => data.timeLabels,
                  yValueMapper: (BpChartData data, _) => data.value,
                  splineType: SplineType.natural,
                  color: const Color(0xFF4F7396),
                  markerSettings: const MarkerSettings(
                    isVisible: true,
                    width: 8,
                    height: 8,

                    borderWidth: 1, 
                    borderColor: Colors.white,
                    color: Color(0xFF4F7396),
                  ),
                  dataLabelSettings: const DataLabelSettings(isVisible: false),
                ),
                SplineSeries<BpChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (BpChartData data, _) => data.timeLabels,
                  yValueMapper: (BpChartData data, _) => data.value2,

                  splineType: SplineType.natural,
                  color: const Color(0XFF3A4750),
                  width: 2,
                  markerSettings: const MarkerSettings(
                    isVisible: true,
                    width: 8,
                    height: 8,
                    borderWidth: 1, 
                    borderColor: Colors.white,
                    color: Color(0XFF3A4750),
                  ),
                  dataLabelSettings: const DataLabelSettings(isVisible: false),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/dot.svg',
                    color: Color(0XFF3A4750),
                    width: 46,
                    height: 46,
                  ),
                  SizedBox(width: 1), // small spacing between dot and label
                  Text(
                    "Systolic",
                    style: TextStyle(fontSize: 20, color: Color(0XFF717171)),
                  ),
                ],
              ),
              SizedBox(width: 12), // spacing between the two pairs
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/dot.svg',
                    color: Color(0XFF4F7396),
                    width: 46,
                    height: 46,
                  ),
                  SizedBox(width: 1),
                  Text(
                    "Diastolic",
                    style: TextStyle(fontSize: 20, color: Color(0XFF717171)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
