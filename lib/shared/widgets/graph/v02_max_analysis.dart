import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/shared/widgets/card/vo2_card.dart';
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
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
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
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(Icons.info_outline, size: 30),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "See More",
                        style: TextStyle(
                          color: Color(0XFF193238),
                          fontSize: 26,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0XFF121417),
                        size: 25,
                      ),
                    ],
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
                          fontSize: 20,
                          color: Color(0XFF707070),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.vo2level,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            " ml/kg/min",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0XFFCCCCCC),
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
                      color: Colors.black, // Black tick lines
                    ),
                    labelPlacement:
                        LabelPlacement.onTicks, // Aligns labels better
                    edgeLabelPlacement:
                        EdgeLabelPlacement.none, // Labels placed correctly
                    labelRotation: 0,
                    majorGridLines: MajorGridLines(
                      width: 1,
                      color: Color(0XFFCCCCCC), // Set default grid lines as red
                    ), // Keeps text straight
                    axisLine: AxisLine(
                      color: Colors.black, // Black X-Axis line
                      width: 1,
                    ),
                  ),
                  primaryYAxis: NumericAxis(
                    minimum: 10,
                    maximum: 50,
                    interval: 10,
                    majorTickLines: MajorTickLines(
                      size: 8,
                      color: Colors.black, // Black tick lines
                    ),
                    majorGridLines: MajorGridLines(
                      width: 1,
                      color: Color(0XFFCCCCCC), // Set default grid lines as red
                    ),
                    axisLine: AxisLine(
                      color: Colors.black, // Black Y-Axis line
                      width: 1,
                    ),
                    plotBands: <PlotBand>[
                      PlotBand(
                        start: 10, // First Y-axis value
                        end: 10,
                        borderColor: Colors.black, // First tick line in black
                        borderWidth: 1,
                      ),
                    ],
                  ),
                  series: <CartesianSeries<dynamic, dynamic>>[
                    SplineSeries<VO2Data, String>(
                      dataSource: chartData,
                      xValueMapper: (VO2Data data, _) => data.time,
                      yValueMapper: (VO2Data data, _) => data.value,
                      splineType: SplineType.natural,
                      color: Color(0XFF3A4750), // Line color
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
                mainAxisAlignment: MainAxisAlignment.center, // Centers the card
                children: [
                  SizedBox(
                    width: 350, // Set a fixed width for the card
                    child: Card(
                      color: Color(0XFFCCCCCC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 14,
                        ), // Reduced padding
                        child: Row(
                          mainAxisSize: MainAxisSize.min, // Keeps card compact
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/Group.png',
                              width: 45, // Adjusted image size
                              height: 45,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "You're VO2 max is 5% increased better than yesterday's.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0XFF333333),
                                ), // Adjusted text size
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
