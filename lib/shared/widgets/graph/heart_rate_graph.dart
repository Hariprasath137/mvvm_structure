// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/heart_rate/data/model/heart_rate_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HeartRateGraph extends StatelessWidget {
  final HeartRateData model;

  const HeartRateGraph({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Scaffold(
        backgroundColor: Colors.white,
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
                    majorTickLines: const MajorTickLines(size: 0),
                    axisLine: const AxisLine(color: Colors.transparent),
                    labelPlacement: LabelPlacement.onTicks,
                    interval: 6,
                    axisLabelFormatter: (details) {
                      int index = details.value.toInt();
                      return model.keyPoints.contains(index)
                          ? ChartAxisLabel(
                            model.timeLabels[index],
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
                    majorTickLines: const MajorTickLines(size: 0),
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
                    labelStyle: const TextStyle(
                      color: Color(0XFFA9AAAA),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  series: <LineSeries<int, String>>[
                    LineSeries<int, String>(
                      dataSource: model.heartRates,
                      xValueMapper:
                          (int value, int index) => model.timeLabels[index],
                      yValueMapper: (int value, _) => value,
                      color: const Color(0xFF637887),
                      width: 2,
                      markerSettings: const MarkerSettings(isVisible: false),
                    ),
                  ],
                  annotations: <CartesianChartAnnotation>[
                    for (int index in model.keyPoints)
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
                        x: model.timeLabels[index],
                        y: model.heartRates[index],
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
