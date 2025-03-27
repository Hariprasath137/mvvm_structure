import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SafeZoneChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      mainData(),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
        drawHorizontalLine: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 30,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 50,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 10,
      minY: 60,
      maxY: 240,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(1, 150),
            FlSpot(2, 200),
            FlSpot(3, 140),
            FlSpot(5, 220),
            FlSpot(6, 130),
            FlSpot(8, 170),
            FlSpot(9, 140),
          ],
          isCurved: true,
          barWidth: 2,
          color: Colors.black,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
          aboveBarData: BarAreaData(show: false),
        ),
        LineChartBarData(
          spots: [
            FlSpot(0, 120),
            FlSpot(10, 120),
            FlSpot(10, 180),
            FlSpot(0, 180),
          ],
          isCurved: false,
          color: Colors.transparent,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          aboveBarData: BarAreaData(show: true, color: Colors.transparent),
          belowBarData: BarAreaData(show: true, color: Colors.grey.withOpacity(0.3)),
        ),
        LineChartBarData(
          spots: [
            FlSpot(0, 180),
            FlSpot(10, 180),
          ],
          isCurved: false,
          color: Colors.transparent,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          aboveBarData: BarAreaData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
        LineChartBarData(
          spots: [
            FlSpot(0, 100),
            FlSpot(10, 100),
          ],
          isCurved: false,
          color: Colors.black45,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
          aboveBarData: BarAreaData(show: false),
          dashArray: [10, 10],
        ),
        LineChartBarData(
          spots: [
            FlSpot(0, 200),
            FlSpot(10, 200),
          ],
          isCurved: false,
          color: Colors.black38,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
          aboveBarData: BarAreaData(show: false),
          dashArray: [10, 10],
        ),
        LineChartBarData(
          spots: [
            FlSpot(0, 220),
            FlSpot(10, 220),
          ],
          isCurved: false,
          color: Colors.black26,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
          aboveBarData: BarAreaData(show: false),
          dashArray: [10, 10],
        ),
      ],
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    if (value == 50) {
      text = '50';
    } else if (value == 100) {
      text = '100';
    } else if (value == 150) {
      text = '150';
    } else if (value == 200) {
      text = '200';
    } else if (value == 250) {
      text = '250';
    } else if (value == 300) {
      text = '300';
    } else {
      return Container();
    }
    return Text(text, style: style, textAlign: TextAlign.left);
  }
}

class GlucoseMonitoringContainer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Glucose Monitoring',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '100',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'mg/dL',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Updated 2 mins ago',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'In Range',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // The red border container for the graph
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.red, width: 2),
                  ),
                  child: SafeZoneChart(), // Insert the graph here
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: Scaffold(body: GlucoseMonitoringContainer1())));
