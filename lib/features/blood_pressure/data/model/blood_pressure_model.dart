class InsightsBp {
  final String imagePath;
  final String text;

  InsightsBp({required this.imagePath, required this.text});

  factory InsightsBp.fromJson(Map<String, dynamic> json) {
    return InsightsBp(imagePath: json['imagePath'], text: json['text']);
  }
}

class BloodPressureModel {
  final List<InsightsBp> insights;
  final int restingBpmBp;
  final int peakBpm;
  final double vo2Max;
  final Doctor doctor;

  BloodPressureModel({
    required this.insights,
    required this.restingBpmBp,
    required this.peakBpm,
    required this.vo2Max,
    required this.doctor,
  });

  factory BloodPressureModel.fromJson(Map<String, dynamic> json) {
    return BloodPressureModel(
      insights:
          (json['insights'] as List)
              .map((e) => InsightsBp.fromJson(e))
              .toList(),
      restingBpmBp: json['resting_bpmBp'] ?? 0,
      peakBpm: json['peak_bpm'] ?? 0,
      vo2Max:
          (json['vo_max'] != null) ? (json['vo_max'] as num).toDouble() : 0.0,
      doctor: Doctor.fromJson(json['doctor']),
    );
  }
}

class Doctor {
  final String name;
  final String field;
  final String description;

  Doctor({required this.name, required this.field, required this.description});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      field: json['field'],
      description: json['description'],
    );
  }
}

class BloodPressureCardModel {
  final String lastMeasured;
  final String bloodPressure;
  final String heartRate;
  final String status;

  BloodPressureCardModel({
    required this.lastMeasured,
    required this.bloodPressure,
    required this.heartRate,
    required this.status,
  });
  factory BloodPressureCardModel.fromJson(Map<String, dynamic> json) {
    return BloodPressureCardModel(
      lastMeasured: json['last_measured'] ?? 'N/A',
      bloodPressure: json['blood_pressure'] ?? 'N/A',
      heartRate: json['heart_rate'] ?? 'N/A',
      status: json['status'] ?? 'N/A',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'last_measured': lastMeasured,
      'blood_pressure': bloodPressure,
      'heart_rate': heartRate,
      'status': status,
    };
  }
}

class BpChartData {
  final String timeLabels;
  final double value;
  final double value2;

  BpChartData({
    required this.timeLabels,
    required this.value,
    required this.value2,
  });

  factory BpChartData.fromJson(Map<String, dynamic> json) {
    return BpChartData(
      timeLabels: (json['timeLabels']).toString(),
      value: (json['value'] as num).toDouble(),
      value2: (json['value2'] as num).toDouble(),
    );
  }
}
