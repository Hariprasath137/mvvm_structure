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
    final jsonString = await rootBundle.loadString(
      'assets/json/heart_screen_data.json',
    );
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

  static Future<List<BpChartData>> loadChartData() async {
    // await Future.delayed(const Duration(seconds: 3));
    final jsonString = await rootBundle.loadString(
      'assets/json/blood_pressure_data.json',
    );
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    final List<dynamic> chartDataJson = jsonData['bp']['chartData'];
    return chartDataJson.map((data) => BpChartData.fromJson(data)).toList();
  }

  static Future<BpTableModel> loadBpTable() async {
    final jsonString = await rootBundle.loadString(
      'assets/json/blood_pressure_data.json',
    );
    final data = json.decode(jsonString);

    return BpTableModel.fromJson(data['bpTable']);
  }

  static Future<MinimumBp> loadMinimum() async {
    final jsonString = await rootBundle.loadString(
      'assets/json/blood_pressure_data.json',
    );
    final data = json.decode(jsonString);
    return MinimumBp.fromJson(data['minimum']);
  }

  static Future<PeakBp> loadPeak() async {
    final jsonString = await rootBundle.loadString(
      'assets/json/blood_pressure_data.json',
    );
    final data = json.decode(jsonString);
    return PeakBp.fromJson(data['peak']);
  }

  static Future<List<BpTrendsModel>> loadBpEntries() async {
    final String response = await rootBundle.loadString(
      'assets/json/blood_pressure_data.json',
    );
    final data = json.decode(response);
    final List<dynamic> entriesList = data['entries'];
    return entriesList.map((item) => BpTrendsModel.fromJson(item)).toList();
  }
}
