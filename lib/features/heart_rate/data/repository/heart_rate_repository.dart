import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mvvm_structure_reference/features/heart_rate/data/model/heart_rate_model.dart';

class HeartRateRepository {
  static Future<HeartRateSummary> loadSummaryData() async {
    final jsonString = await rootBundle.loadString(
      'assets/json/heart_screen_data.json',
    );
    final data = json.decode(jsonString);
    return HeartRateSummary.fromJson(data['summary']['heart_rate_summary']);
  }

  static Future<VO2Model> loadVo2Data() async {
    final String response = await rootBundle.loadString(
      'assets/json/heart_screen_data.json',
    );
    final data = json.decode(response);
    return VO2Model.fromJson(data['vo2']);
  }

  static Future<HeartRateData> loadHeartRateData() async {
    String jsonString = await rootBundle.loadString(
      'assets/json/heart_screen_data.json',
    );
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return HeartRateData.fromJson(jsonMap['graph']);
  }

  static Future<List<HeartRateEntry>> loadHeartRateEntries() async {
    final String response = await rootBundle.loadString(
      'assets/json/heart_screen_data.json',
    );
    final data = json.decode(response);
    final List<dynamic> entriesList = data['entries'];
    return entriesList.map((item) => HeartRateEntry.fromJson(item)).toList();
  }

  static Future<RestingHr> loadRestingHeartRate() async {
    final String response = await rootBundle.loadString(
      'assets/json/heart_screen_data.json',
    );

    final Map<String, dynamic> data = json.decode(response);
    return RestingHr.fromJson(data['resting']);
  }

  static Future<HeartRateEcg> loadHeartRateEcg() async {
    final String jsonString = await rootBundle.loadString(
      'assets/json/heart_screen_data.json',
    );
    final jsonData = jsonDecode(jsonString);
    final ecgData = jsonData['ecg'];

    return HeartRateEcg(
      heartRate: ecgData['heartRate'],
      status: ecgData['status'],
      message: ecgData['message'],
    );
  }

  static Future<HeartTableModel> loadTableData() async {
    final jsonString = await rootBundle.loadString(
      'assets/json/heart_screen_data.json',
    );
    final tableValue = json.decode(jsonString);
    return HeartTableModel.fromJson(tableValue['heartRateTable']);
  }
}
