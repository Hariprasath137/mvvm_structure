import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_structure_reference/features/heart_rate/data/model/heart_rate_model.dart';
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
  VO2Model? vo2Model;

  @override
  void initState() {
    super.initState();
    loadVo2Data();
  }

  Future<void> loadVo2Data() async {
    final String response = await rootBundle.loadString(
      'assets/json/vo2_data.json',
    );
    final data = json.decode(response);
    setState(() {
      vo2Model = VO2Model.fromJson(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (vo2Model == null) {
      return const Center(child: CircularProgressIndicator());
    }
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
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(Icons.info_outline, size: screenWidth * 0.07),
                    ],
                  ),
                  Expanded(
                    child: Wrap(
                      alignment: WrapAlignment.end,
                      spacing: 4,
                      children: [
                        Text(
                          "See More",
                          style: TextStyle(
                            color: Color(0XFF193238),
                            fontSize: screenWidth * 0.05,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Color(0XFF121417),
                          size: screenWidth * 0.06,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        vo2Model!.vo2Level,
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " ml/kg/min",
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: Color(0XFFA9AAAA),
                        ),
                      ),
                    ],
                  ),

                  Chip(
                    label: Text(
                      vo2Model!.category,
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Color(0XFFA9AAAA),
                  ),
                ],
              ),
              const SizedBox(height: 24),

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
                  series: <CartesianSeries>[
                    SplineSeries<VO2Data, DateTime>(
                      dataSource: vo2Model!.chartData,
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
                    width: screenWidth * 0.8,
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
                              width: screenWidth * 0.1,
                              height: screenWidth * 0.1,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "You're VO2 max is 5% increased better than yesterday's.",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
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
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Vo2Card(stateType: "Minimum", value: vo2Model!.min),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Vo2Card(stateType: "Average", value: vo2Model!.avg),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Vo2Card(stateType: "Maximum", value: vo2Model!.max),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 200,
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
