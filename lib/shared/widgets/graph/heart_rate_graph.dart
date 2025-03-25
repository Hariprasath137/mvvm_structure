import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Vo2MaxWidget extends StatefulWidget {
  const Vo2MaxWidget({super.key});

  @override
  State<Vo2MaxWidget> createState() => _Vo2MaxWidgetState();
}

class _Vo2MaxWidgetState extends State<Vo2MaxWidget> {
  final List<int> _data = [3, 7, 9, 5, 6, 10];

  // void _updateData() {
  //   setState(() {
  //     // Generate random values between 1 and 10
  //     _data = List.generate(6, (index) => Random().nextInt(10) + 1);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  interval: 1,
                  labelPlacement: LabelPlacement.onTicks,
                  majorGridLines: MajorGridLines(width: 0),
                  axisLabelFormatter: (AxisLabelRenderDetails details) {
                    List<String> timeLabels = [
                      '12 AM',
                      '6 AM',
                      '12 PM',
                      '6 PM',
                    ];
                    return ChartAxisLabel(
                      timeLabels[details.value.toInt() % timeLabels.length],
                      const TextStyle(color: Colors.black),
                    );
                  },
                ),
                series: <LineSeries<int, int>>[
                  LineSeries<int, int>(
                    dataSource: _data,
                    xValueMapper: (int value, int index) => index,
                    yValueMapper: (int value, _) => value * 10,
                    color: Colors.blue,
                    markerSettings: const MarkerSettings(
                      isVisible: true,
                      shape: DataMarkerType.circle,
                      borderColor: Colors.black,
                      color: Colors.black,
                      borderWidth: 2,
                      width: 8,
                      height: 8,
                    ),
                    pointColorMapper:
                        (int value, int index) =>
                            index == 6 ? Colors.red : Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
