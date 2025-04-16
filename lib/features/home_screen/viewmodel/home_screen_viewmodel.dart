import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mvvm_structure_reference/features/home_screen/data/home_screen_model.dart';

// Load both Greeting and Health Info from the combined JSON file
// Future<Greeting> loadGreeting() async {
//   final String response = await rootBundle.loadString('assets/json/homescreen_data.json');
//   final Map<String, dynamic> data = json.decode(response);
//   return Greeting.fromJson(data['greeting']);
// }

Future<List<HealthInfo>> loadHealthInfo() async {
  final String response = await rootBundle.loadString('assets/json/homescreen_data.json');
  final Map<String, dynamic> data = json.decode(response);
  final List<dynamic> healthList = data['healthInfo'];
  return healthList.map((item) => HealthInfo.fromJson(item)).toList();
}

// Future<List<String>> loadActivityLog() async {
//   final String response = await rootBundle.loadString('assets/json/homescreen_data.json');
//   final Map<String, dynamic> data = json.decode(response);
//   final List<dynamic> logList = data['activityLog'];
//   return logList.cast<String>();
// }

// Future<RingDetectionData> loadRingDetectionData() async {
//   final String response = await rootBundle.loadString('assets/json/homescreen_data.json');
//   final data = json.decode(response);
//   return RingDetectionData.fromJson(data['ringDetection']);
// }

Future<Map<String, dynamic>> _loadJson() async {
  final String response = await rootBundle.loadString('assets/json/homescreen_data.json');
  return json.decode(response);
}

// Load greeting
Future<Greeting> loadGreeting() async {
  final data = await _loadJson();
  return Greeting.fromJson(data['greeting']);
}

// Load wellness tips (carousel)
Future<List<String>> loadWellnessTips() async {
  final data = await _loadJson();
  return List<String>.from(data['wellnessTips']);
}

// Glucose monitoring tips
Future<List<String>> loadGlucoseTips() async {
  final data = await _loadJson();
  return List<String>.from(data['glucoseTips']);
}

// Activity carousel (swipe cards)
Future<List<ActivityItem>> loadActivityCarousel() async {
  final data = await _loadJson();
  return (data['activityCarousel'] as List)
      .map((item) => ActivityItem.fromJson(item))
      .toList();
}

// Heart rate
Future<HeartRateData> loadHeartRateData() async {
  final data = await _loadJson();
  return HeartRateData.fromJson(data['heartRate']);
}

// ECG
Future<ECGData> loadECGData() async {
  final data = await _loadJson();
  return ECGData.fromJson(data['ecg']);
}

// Stress
Future<StressData> loadStressData() async {
  final data = await _loadJson();
  return StressData.fromJson(data['stress']);
}

// Blood Pressure & HRV
Future<BpHrvData> loadBPData() async {
  final data = await _loadJson();
  return BpHrvData.fromJson(data['bp']);
}

Future<BpHrvData> loadHRVData() async {
  final data = await _loadJson();
  return BpHrvData.fromJson(data['hrv']);
}

// Sleep
Future<SleepData> loadSleepData() async {
  final data = await _loadJson();
  return SleepData.fromJson(data['sleep']);
}

Future<List<SimpleMetric>> loadSimpleMetrics() async {
  final String response = await rootBundle.loadString('assets/json/homescreen_data.json');
  final Map<String, dynamic> data = json.decode(response);
  final List<dynamic> metricsList = data['simpleMetrics'];
  return metricsList.map((item) => SimpleMetric.fromJson(item)).toList();
}


// Fall Detection
Future<FallDetectionData> loadFallDetectionData() async {
  final data = await _loadJson();
  return FallDetectionData.fromJson(data['fallDetection']);
}

// AFib Monitoring
Future<AfibData> loadAfibData() async {
  final data = await _loadJson();
  return AfibData.fromJson(data['afibMonitoring']);
}

// Hydration
Future<HydrationData> loadHydrationData() async {
  final data = await _loadJson();
  return HydrationData.fromJson(data['hydration']);
}

// Medication
Future<MedicationData> loadMedicationData() async {
  final data = await _loadJson();
  return MedicationData.fromJson(data['medication']);
}

// Daily Goals
Future<List<ProgressDataModel>> loadDailyGoals() async {
  final data = await _loadJson();
  return (data['dailyGoals'] as List)
      .map((e) => ProgressDataModel.fromJson(e))
      .toList();
}

// Achievements
Future<List<AchievementModel>> loadAchievements() async {
  final data = await _loadJson();
  return (data['achievements'] as List)
      .map((e) => AchievementModel.fromJson(e))
      .toList();
}

// Doctor
Future<DoctorData> loadDoctorData() async {
  final data = await _loadJson();
  return DoctorData.fromJson(data['doctor']);
}

// Activity Log (for Ring Detected)
Future<List<String>> loadActivityLog() async {
  final data = await _loadJson();
  return List<String>.from(data['activityLog']);
}

// Ring Detection Data
Future<RingDetectionData> loadRingDetectionData() async {
  final data = await _loadJson();
  return RingDetectionData.fromJson(data['ringDetection']);
}
