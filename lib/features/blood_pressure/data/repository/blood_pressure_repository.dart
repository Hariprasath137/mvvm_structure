import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mvvm_structure_reference/features/blood_pressure/data/model/blood_pressure_model.dart';
import 'package:mvvm_structure_reference/features/heart_rate/data/model/heart_rate_model.dart';

class BloodPressureRepository {
  Future<BloodPressureModel> loadSummaryData() async {
    final jsonString = await rootBundle.loadString(
      'assets/json/blood_pressure_data.json',
    );
    final data = json.decode(jsonString);
    return BloodPressureModel.fromJson(data['blood_pressure']);
  }

  Future<VO2Model> loadVo2Data() async {
    final jsonString = await rootBundle.loadString('assets/json/model.json');
    final data = json.decode(jsonString);
    return VO2Model.fromJson(data['vo2']);
  }

  Future<BloodPressureCardModel> loadJsonData() async {
    final jsonString = await rootBundle.loadString(
      'assets/json/blood_pressure_data.json',
    );
    final data = json.decode(jsonString);
    return BloodPressureCardModel.fromJson(data['card']);
  }

  Future<List<BpChartData>> loadChartData() async {
    await Future.delayed(const Duration(seconds: 2));
    final jsonString = await rootBundle.loadString(
      'assets/json/blood_pressure_data.json',
    );
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    final List<dynamic> chartDataJson = jsonData['bp']['chartData'];
    return chartDataJson.map((data) => BpChartData.fromJson(data)).toList();
  }
}
