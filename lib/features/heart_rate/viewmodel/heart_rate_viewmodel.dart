import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mvvm_structure_reference/features/heart_rate/data/model/heart_rate_model.dart';

Future<HeartRateData> loadHeartRateData() async {
  String jsonString = await rootBundle.loadString(
    'assets/json/heartRates_graph_data.json',
  );
  final Map<String, dynamic> jsonMap = json.decode(jsonString);
  return HeartRateData.fromJson(jsonMap);
}
