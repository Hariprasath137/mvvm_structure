// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HeartRateGraph extends StatefulWidget {
  const HeartRateGraph({super.key});

  @override
  State<HeartRateGraph> createState() => _HeartRateGraphState();
}

class _HeartRateGraphState extends State<HeartRateGraph> {
  final List<int> _mainData = [
    70,
    72,
    68,
    72,
    75,
    83,
    115,
    70,
    75,
    79,
    80,
    90,
    70,
    77,
    88,
    78,
    110,
    80,
    100,
    90,
    62,
    72,
    70,
    70,
    79,
    79,
  ];

  final List<String> _timeLabels = [
    '12\nAM',
    '1\nAM',
    '2\nAM',
    '3\nAM',
    '4\nAM',
    '5\nAM',
    '6\nAM',
    '7\nAM',
    '8\nAM',
    '9\nAM',
    '10\nAM',
    '11\nAM',
    '12\nPM',
    '1\nPM',
    '2\nPM',
    '3\nPM',
    '4\nPM',
    '5\nPM',
    '6\nPM',
    '7\nPM',
    '8\nPM',
    '9\nPM',
    '10\nPM',
    '11\nPM',
    '12\nAM ',
    '1\nAM ',
  ];

  final List<int> _keyPoints = [0, 6, 12, 18, 24];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryXAxis: CategoryAxis(
                    majorGridLines: const MajorGridLines(width: 0),
                    axisLine: const AxisLine(color: Colors.transparent),
                    labelPlacement: LabelPlacement.onTicks,
                    interval: 6,
                    axisLabelFormatter: (AxisLabelRenderDetails details) {
                      int index = details.value.toInt();
                      return _keyPoints.contains(index)
                          ? ChartAxisLabel(
                            _timeLabels[index],
                            const TextStyle(
                              color: Color(0XFFA9AAAA),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                          : ChartAxisLabel('', const TextStyle());
                    },
                  ),
                  primaryYAxis: NumericAxis(
                    minimum: 40,
                    maximum: 140,
                    interval: 20,
                    majorGridLines: const MajorGridLines(
                      width: 1,
                      dashArray: [4, 4],
                    ),
                    axisLine: const AxisLine(color: Colors.transparent),
                    plotBands: [
                      PlotBand(
                        start: 60,
                        end: 100,
                        color: const Color(0xFF4F7396).withOpacity(0.3),
                        borderColor: Colors.grey,
                        borderWidth: 0.5,
                      ),
                    ],
                    // 🎯 Set Y-axis label color and style
                    labelStyle: const TextStyle(
                      color: Color(
                        0XFFA9AAAA,
                      ), // Change this to any color you want
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),

                  series: <LineSeries<int, String>>[
                    LineSeries<int, String>(
                      dataSource: _mainData,
                      xValueMapper:
                          (int value, int index) => _timeLabels[index],
                      yValueMapper: (int value, _) => value,
                      color: const Color(0xFF637887),
                      width: 2,
                      // Hide all markers globally
                      markerSettings: const MarkerSettings(isVisible: false),
                    ),
                  ],
                  // ✅ Annotations for black-filled markers at key points
                  annotations: <CartesianChartAnnotation>[
                    for (int index in _keyPoints)
                      CartesianChartAnnotation(
                        widget: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0XFF193238),
                            shape: BoxShape.circle,
                          ),
                        ),
                        coordinateUnit: CoordinateUnit.point,
                        x: _timeLabels[index],
                        y: _mainData[index],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
