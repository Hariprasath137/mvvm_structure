import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mvvm_structure_reference/features/heart_rate/data/model/heart_rate_model.dart';

class HeartRateRepository {
  static Future<HeartRateSummary> loadSummaryData() async {
    final jsonString = await rootBundle.loadString('assets/json/model.json');
    final data = json.decode(jsonString);
    return HeartRateSummary.fromJson(data['summary']['heart_rate_summary']);
  }

  static Future<VO2Model> loadVo2Data() async {
    final String response = await rootBundle.loadString('assets/json/model.json');
    final data = json.decode(response);
    return VO2Model.fromJson(data['vo2']);
  }

  static Future<HeartRateData> loadHeartRateData() async {
  String jsonString = await rootBundle.loadString('assets/json/model.json');
  final Map<String, dynamic> jsonMap = json.decode(jsonString);
  return HeartRateData.fromJson(jsonMap['graph']);
}

}
