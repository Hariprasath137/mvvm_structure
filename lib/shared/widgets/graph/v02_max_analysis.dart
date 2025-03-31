import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/shared/widgets/card/vo2_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/v02_curosal_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Vo2MaxAnalysis extends StatefulWidget {
  final String vo2level;

  const Vo2MaxAnalysis({super.key, required this.vo2level});

  @override
  State<Vo2MaxAnalysis> createState() => _Vo2MaxAnalysisState();
}

class _Vo2MaxAnalysisState extends State<Vo2MaxAnalysis> {
  // Updated chart data with meaningful time labels
  final List<VO2Data> chartData = [
    VO2Data("12\nAM", 25),
    VO2Data("6\nAM", 27),
    VO2Data("12\nPM", 30),
    VO2Data("6\nPM", 33),
    VO2Data("12\nAM ", 35),
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Color(0XFFF6F8F9),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "VO2 Max Analysis",
                        style: TextStyle(
                          fontSize: screenWidth * 0.06, // Responsive font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(Icons.info_outline, size: screenWidth * 0.07),
                    ],
                  ),
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "See More",
                          style: TextStyle(
                            color: Color(0XFF193238),
                            fontSize:
                                screenWidth * 0.05, // Responsive font size
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward,
                          color: Color(0XFF121417),
                          size: screenWidth * 0.06, // Responsive icon size
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Current VO2 Max
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Current VO2 max",
                        style: TextStyle(
                          fontSize: screenWidth * 0.045, // Responsive font size
                          color: Color(0XFF707070),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.vo2level,
                            style: TextStyle(
                              fontSize:
                                  screenWidth * 0.06, // Responsive font size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            " ml/kg/min",
                            style: TextStyle(
                              fontSize:
                                  screenWidth * 0.04, // Responsive font size
                              color: Color(0XFFA9AAAA),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Chart Section
              SizedBox(
                height: 250,
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(
                    majorTickLines: MajorTickLines(
                      size: 8,
                      color: Colors.black,
                    ),
                    labelPlacement: LabelPlacement.onTicks,
                    edgeLabelPlacement: EdgeLabelPlacement.none,
                    labelRotation: 0,
                    majorGridLines: MajorGridLines(
                      width: 1,
                      color: Color(0XFFCCCCCC),
                    ),
                    axisLine: AxisLine(color: Colors.black, width: 1),
                  ),
                  primaryYAxis: NumericAxis(
                    minimum: 10,
                    maximum: 50,
                    interval: 10,
                    majorTickLines: MajorTickLines(
                      size: 8,
                      color: Colors.black,
                    ),
                    majorGridLines: MajorGridLines(
                      width: 1,
                      color: Color(0XFFCCCCCC),
                    ),
                    axisLine: AxisLine(color: Colors.black, width: 1),
                  ),
                  series: <CartesianSeries<dynamic, dynamic>>[
                    SplineSeries<VO2Data, String>(
                      dataSource: chartData,
                      xValueMapper: (VO2Data data, _) => data.time,
                      yValueMapper: (VO2Data data, _) => data.value,
                      splineType: SplineType.natural,
                      color: Color(0XFF3A4750),
                      markerSettings: MarkerSettings(
                        isVisible: true,
                        width: 8,
                        height: 8,
                        borderWidth: 2,
                        borderColor: Colors.black,
                        color: Colors.black,
                      ),
                      dataLabelSettings: DataLabelSettings(isVisible: false),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenWidth * 0.8, // Responsive width
                    child: Card(
                      color: Color(0XFFCCCCCC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 14,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/Group.png',
                              width: screenWidth * 0.1, // Responsive image size
                              height: screenWidth * 0.1,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "You're VO2 max is 5% increased better than yesterday's.",
                                style: TextStyle(
                                  fontSize:
                                      screenWidth *
                                      0.04, // Responsive font size
                                  color: Color(0XFF333333),
                                ),
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  "VO2 Max Summary",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Vo2Card(stateType: "Minimum", value: '35'),
                  Vo2Card(stateType: "Average", value: '42'),
                  Vo2Card(stateType: "Maximum", value: '48'),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: V02CurosalWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Data Model for VO2 Max Analysis
class VO2Data {
  final String time;
  final double value;

  VO2Data(this.time, this.value);
}
