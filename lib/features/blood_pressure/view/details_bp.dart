// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mvvm_structure_reference/features/blood_pressure/data/model/blood_pressure_model.dart';
import 'package:mvvm_structure_reference/features/blood_pressure/data/repository/blood_pressure_repository.dart';
import 'package:mvvm_structure_reference/features/blood_pressure/viewmodel/blood_pressure_viewmodel.dart';
import 'package:mvvm_structure_reference/shared/widgets/blood_pressure_widget/graph/bp_chart.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/graph/heart_details_graph.dart';
import 'package:provider/provider.dart';

class DetailsScreenBp extends StatelessWidget {
  final BpTrendsModel entry;

  const DetailsScreenBp({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (_) => BloodPressureViewModel(BloodPressureRepository())..loadData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Details"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Consumer<BloodPressureViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return Center(
                child: SpinKitThreeBounce(size: 50, color: Colors.blueGrey),
              );
            }
            final chart = viewModel.bpChart!;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFF747A7B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                entry.timestamp,
                                style: TextStyle(color: Color(0XFFFFFFFF)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Image.asset(
                              'assets/Vector.png',
                              color: Color(0XFFFFFFFF),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),

                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 150.0,
                          backgroundColor: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                entry.activity,
                                style: TextStyle(color: Color(0XFF6B7280)),
                              ),
                              SizedBox(height: 8),

                              Text(
                                entry.bpm,
                                style: TextStyle(
                                  fontSize: 60.0,
                                  color: Color(0XFF111827),
                                  fontWeight: FontWeight.bold,
                                  height: 1.0,
                                ),
                                textAlign: TextAlign.center,
                              ),

                              Text(
                                "mmHg",
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Color(0XFF6B7280),
                                ),
                              ),
                              Chip(
                                label: Text(
                                  entry.status,
                                  style: TextStyle(color: Color(0XFFFFFFFF)),
                                ),
                                backgroundColor: Color(0xFF3A4750),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),

                  Container(
                    width: double.infinity,
                    color: Color(0XFFFFFFFF),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            children: [
                              Text(
                                "Today's Trend",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Last 24 hours",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0XFF767676),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 350, child: BpChart(chartData: chart)),

                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Card(
                            color: Color(0XFFE0EEF8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/Group.png",
                                        height: 25,
                                        width: 25,
                                        color: Color(0XFF0066FF),
                                      ),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Heart Rate Insight",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "Your heart rate is within the normal range for ${entry.activity}. Keep up the steady pace!",
                                              style: TextStyle(fontSize: 14.0),
                                              overflow: TextOverflow.fade,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Recommendations
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Card(
                            color: Color(0XFFFFFFFF),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/waterdrop.png",
                                        height: 25,
                                        width: 25,
                                        color: Color(0XFF0066FF),
                                      ),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Recommendations",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "Stay hydrated and maintain your current pace. Your body is responding well to this activity level.",
                                              style: TextStyle(fontSize: 14.0),
                                              overflow: TextOverflow.fade,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
