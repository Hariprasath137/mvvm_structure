class HeartRateSummary {
  final List<Insight> insights;
  final int restingBpm;
  final int peakBpm;
  final Doctor doctor;

  HeartRateSummary({
    required this.insights,
    required this.restingBpm,
    required this.peakBpm,
    required this.doctor,
  });

  factory HeartRateSummary.fromJson(Map<String, dynamic> json) {
    return HeartRateSummary(
      insights:
          (json['insights'] as List).map((e) => Insight.fromJson(e)).toList(),
      restingBpm: json['resting_bpm'],
      peakBpm: json['peak_bpm'],
      doctor: Doctor.fromJson(json['doctor']),
    );
  }
}

class Insight {
  final String imagePath;
  final String text;

  Insight({required this.imagePath, required this.text});

  factory Insight.fromJson(Map<String, dynamic> json) {
    return Insight(imagePath: json['imagePath'], text: json['text']);
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

class VO2Data {
  final String timeLabels;
  final double value;

  VO2Data({required this.timeLabels, required this.value});

  factory VO2Data.fromJson(Map<String, dynamic> json) {
    return VO2Data(
      timeLabels: (json['timeLabels']).toString(),
      value: (json['value'] as num).toDouble(),
    );
  }
}

class VO2Model {
  final String vo2Level;
  final String min;
  final String avg;
  final String max;
  final String category;
  final List<VO2Data> chartData;

  VO2Model({
    required this.vo2Level,
    required this.min,
    required this.avg,
    required this.max,
    required this.chartData,
    required this.category,
  });

  factory VO2Model.fromJson(Map<String, dynamic> json) {
    return VO2Model(
      vo2Level: json['vo2level'],
      min: json['min'],
      avg: json['avg'],
      max: json['max'],
      category: json['category'],
      chartData:
          (json['chartData'] as List).map((e) => VO2Data.fromJson(e)).toList(),
    );
  }
}

class HeartRateData {
  final List<int> heartRates;
  final List<String> timeLabels;
  final List<int> keyPoints;

  HeartRateData({
    required this.heartRates,
    required this.timeLabels,
    required this.keyPoints,
  });

  factory HeartRateData.fromJson(Map<String, dynamic> json) {
    return HeartRateData(
      heartRates: List<int>.from(json['heartRates']),
      timeLabels: List<String>.from(json['timeLabels']),
      keyPoints: List<int>.from(json['keyPoints']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'heartRates': heartRates,
      'timeLabels': timeLabels,
      'keyPoints': keyPoints,
    };
  }
}

class HeartRateEcg {
  final int heartRate;
  final String status;
  final String message;

  HeartRateEcg({
    required this.heartRate,
    required this.status,
    required this.message,
  });

  factory HeartRateEcg.fromJson(Map<String, dynamic> json) {
    return HeartRateEcg(
      heartRate: json['heartRate'],
      status: json['status'],
      message: json['message'],
    );
  }
}
