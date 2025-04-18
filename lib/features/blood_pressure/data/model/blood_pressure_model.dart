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

class BpTableMod {
  final String age;
  final String range;

  BpTableMod({required this.age, required this.range});

  factory BpTableMod.fromJson(Map<String, dynamic> json) {
    return BpTableMod(age: json['age'], range: json['range']);
  }
}

class BpTableModel {
  final String title;
  final List<BpTableMod> data;

  BpTableModel({required this.title, required this.data});

  factory BpTableModel.fromJson(Map<String, dynamic> json) {
    final value =
        (json['data'] as List).map((e) => BpTableMod.fromJson(e)).toList();
    return BpTableModel(title: json['title'] ?? "", data: value);
  }
}

class MinimumBp {
  final String title;
  final String value;

  MinimumBp({required this.title, required this.value});

  factory MinimumBp.fromJson(Map<String, dynamic> json) {
    return MinimumBp(title: json['title'], value: json['value']);
  }
}

class PeakBp {
  final String title;
  final String value;

  PeakBp({required this.title, required this.value});

  factory PeakBp.fromJson(Map<String, dynamic> json) {
    return PeakBp(title: json['title'], value: json['value']);
  }
}

class BpTrendsModel {
  final String bpm;
  final String status;
  final String activity;
  final String timestamp;

  BpTrendsModel({
    required this.bpm,
    required this.status,
    required this.activity,
    required this.timestamp,
  });

  factory BpTrendsModel.fromJson(Map<String, dynamic> json) {
    return BpTrendsModel(
      bpm: json['bpm'],
      status: json['status'],
      activity: json['activity'],
      timestamp: json['timestamp'],
    );
  }
}
