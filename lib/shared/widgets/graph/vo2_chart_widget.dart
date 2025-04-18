import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/heart_rate/data/model/heart_rate_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Vo2MaxChartSection extends StatelessWidget {
  final VO2Model vo2Model;

  const Vo2MaxChartSection({super.key, required this.vo2Model});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
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
                        color: const Color(0XFF193238),
                        fontSize: screenWidth * 0.05,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: const Color(0XFF121417),
                      size: screenWidth * 0.06,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, 
            children: [
              Text(
                "Current VO2 Max", 
                style: TextStyle(
                  fontSize:
                      screenWidth *
                      0.04, 
                  color: const Color(0XFFA9AAAA), 
                ),
              ),
              const SizedBox(
                height: 4,
              ), 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        vo2Model.vo2Level, 
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " ml/kg/min", 
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: const Color(0XFFA9AAAA),
                        ),
                      ),
                    ],
                  ),
                  Chip(
                    label: Text(
                      vo2Model.category,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: const Color(0XFFA9AAAA),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          
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
                minimum: 10,
                maximum: 50,
                interval: 10,
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
                SplineSeries<VO2Data, dynamic>(
                  dataSource: vo2Model.chartData,
                  xValueMapper: (VO2Data data, _) => data.timeLabels,
                  yValueMapper: (VO2Data data, _) => data.value,
                  splineType: SplineType.natural,
                  color: const Color(0XFF3A4750),
                  markerSettings: const MarkerSettings(
                    isVisible: true,
                    width: 8,
                    height: 8,
                    borderWidth: 1,
                    borderColor: Colors.white,
                    color: Colors.black,
                  ),
                  dataLabelSettings: const DataLabelSettings(isVisible: false),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
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
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
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
        ],
      ),
    );
  }
}
