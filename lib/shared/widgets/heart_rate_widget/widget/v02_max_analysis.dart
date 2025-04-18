import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_structure_reference/features/heart_rate/data/model/heart_rate_model.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/vo2_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/v02_curosal_widget.dart';

class Vo2MaxAnalysis extends StatefulWidget {
  const Vo2MaxAnalysis({super.key});

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
      'assets/json/heart_screen_data.json',
    );
    final data = json.decode(response);
    setState(() {
      vo2Model = VO2Model.fromJson(data['vo2']);
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
