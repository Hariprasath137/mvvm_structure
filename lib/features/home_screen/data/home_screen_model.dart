class Greeting {
  final String greetingMessage;
  final String batteryPercentage;
  final String date;
  final String connectionStatus;

  Greeting({
    required this.greetingMessage,
    required this.batteryPercentage,
    required this.date,
    required this.connectionStatus,
  });

  factory Greeting.fromJson(Map<String, dynamic> json) {
    return Greeting(
      greetingMessage: json['greetingMessage'],
      batteryPercentage: json['batteryPercentage'],
      date: json['date'],
      connectionStatus: json['connectionStatus'],
    );
  }
}

class HealthInfo {
  final String title;
  final String subtitle;

  HealthInfo({
    required this.title,
    required this.subtitle,
  });

  factory HealthInfo.fromJson(Map<String, dynamic> json) {
    return HealthInfo(
      title: json['title'],
      subtitle: json['subtitle'],
    );
  }
}

typedef ActivityLog = List<String>;

class IconTextData {
  final String icon;
  final String text;

  IconTextData({required this.icon, required this.text});

  factory IconTextData.fromJson(Map<String, dynamic> json) {
    return IconTextData(
      icon: json['icon'],
      text: json['text'],
    );
  }
}

class RingDetectionData {
  final String time;
  final String activity;
  final List<IconTextData> iconsAndText;

  RingDetectionData({
    required this.time,
    required this.activity,
    required this.iconsAndText,
  });

  factory RingDetectionData.fromJson(Map<String, dynamic> json) {
    return RingDetectionData(
      time: json['time'],
      activity: json['activity'],
      iconsAndText: (json['iconsAndText'] as List)
          .map((item) => IconTextData.fromJson(item))
          .toList(),
    );
  }
}

class ActivityItem {
  final String activity;
  final int steps;
  final String unit;
  final int goal;

  ActivityItem({
    required this.activity,
    required this.steps,
    required this.unit,
    required this.goal,
  });

  factory ActivityItem.fromJson(Map<String, dynamic> json) {
    return ActivityItem(
      activity: json['activity'],
      steps: json['step'],
      unit: json['unit'],
      goal: json['goal'],
    );
  }
}

class HeartRateData {
  final int normal;
  final int resting;
  final int peak;
  final String status;

  HeartRateData({
    required this.normal,
    required this.resting,
    required this.peak,
    required this.status,
  });

  factory HeartRateData.fromJson(Map<String, dynamic> json) {
    return HeartRateData(
      normal: json['normal'],
      resting: json['resting'],
      peak: json['peak'],
      status: json['status'],
    );
  }
}

class ECGData {
  final String lastTracked;
  final int heartRate;
  final int pulseTransitTime;

  ECGData({
    required this.lastTracked,
    required this.heartRate,
    required this.pulseTransitTime,
  });

  factory ECGData.fromJson(Map<String, dynamic> json) {
    return ECGData(
      lastTracked: json['lastTracked'],
      heartRate: json['heartRate'],
      pulseTransitTime: json['pulseTransitTime'],
    );
  }
}

class StressData {
  final String level;
  final String peak;
  final String tip;

  StressData({
    required this.level,
    required this.peak,
    required this.tip,
  });

  factory StressData.fromJson(Map<String, dynamic> json) {
    return StressData(
      level: json['level'],
      peak: json['peak'],
      tip: json['tip'],
    );
  }
}

class BpHrvData {
  final String label;
  final String value;
  final String unit;
  final String range;

  BpHrvData({
    required this.label,
    required this.value,
    required this.unit,
    required this.range,
  });

  factory BpHrvData.fromJson(Map<String, dynamic> json) {
    return BpHrvData(
      label: json['label'],
      value: json['value'],
      unit: json['unit'],
      range: json['range'],
    );
  }
}

class SleepData {
  final int quality;
  final List<SleepStage> stages;

  SleepData({
    required this.quality,
    required this.stages,
  });

  factory SleepData.fromJson(Map<String, dynamic> json) {
    return SleepData(
      quality: json['quality'],
      stages: (json['stages'] as List)
          .map((stage) => SleepStage.fromJson(stage))
          .toList(),
    );
  }
}

class SleepStage {
  final String stage;
  final String time;

  SleepStage({
    required this.stage,
    required this.time,
  });

  factory SleepStage.fromJson(Map<String, dynamic> json) {
    return SleepStage(
      stage: json['stage'],
      time: json['time'],
    );
  }
}

class SimpleMetric {
  final String label;
  final int value;
  final String metric;
  final String range;

  SimpleMetric({
    required this.label,
    required this.value,
    required this.metric,
    required this.range,
  });

  factory SimpleMetric.fromJson(Map<String, dynamic> json) {
    return SimpleMetric(
      label: json['label'],
      value: json['value'],
      metric: json['metric'],
      range: json['range'],
    );
  }
}

class FallDetectionData {
  final String title;
  final String status;
  final String contactName;
  final String contactPhone;

  FallDetectionData({
    required this.title,
    required this.status,
    required this.contactName,
    required this.contactPhone,
  });

  factory FallDetectionData.fromJson(Map<String, dynamic> json) {
    return FallDetectionData(
      title: json['title'],
      status: json['status'],
      contactName: json['contactName'],
      contactPhone: json['contactPhone'],
    );
  }
}

class AfibData {
  final String title;
  final String status;

  AfibData({
    required this.title,
    required this.status,
  });

  factory AfibData.fromJson(Map<String, dynamic> json) {
    return AfibData(
      title: json['title'],
      status: json['status'],
    );
  }
}

class HydrationData {
  final String dailyGoal;
  final String status;
  final String consumed;
  final String remaining;

  HydrationData({
    required this.dailyGoal,
    required this.status,
    required this.consumed,
    required this.remaining,
  });

  factory HydrationData.fromJson(Map<String, dynamic> json) {
    return HydrationData(
      dailyGoal: json['dailyGoal'],
      status: json['hydrationStatus'],
      consumed: json['consumed'],
      remaining: json['remaining'],
    );
  }
}

class MedicationData {
  final String time;
  final String name;
  final String dosage;
  final String pillCount;
  final bool isPassed;

  MedicationData({
    required this.time,
    required this.name,
    required this.dosage,
    required this.pillCount,
    required this.isPassed,
  });

  factory MedicationData.fromJson(Map<String, dynamic> json) {
    return MedicationData(
      time: json['time'],
      name: json['name'],
      dosage: json['dosage'],
      pillCount: json['pillCount'],
      isPassed: json['isPassed'],
    );
  }
}

class ProgressDataModel {
  final String title;
  final int progress;
  final int goal;
  final String color;

  ProgressDataModel({
    required this.title,
    required this.progress,
    required this.goal,
    required this.color,
  });

  factory ProgressDataModel.fromJson(Map<String, dynamic> json) {
    return ProgressDataModel(
      title: json['title'],
      progress: json['progress'],
      goal: json['goal'],
      color: json['color'],
    );
  }
}

class AchievementModel {
  final String activity;
  final String day;

  AchievementModel({
    required this.activity,
    required this.day,
  });

  factory AchievementModel.fromJson(Map<String, dynamic> json) {
    return AchievementModel(
      activity: json['activity'],
      day: json['day'],
    );
  }
}

class DoctorData {
  final String name;
  final String field;
  final String description;

  DoctorData({
    required this.name,
    required this.field,
    required this.description,
  });

  factory DoctorData.fromJson(Map<String, dynamic> json) {
    return DoctorData(
      name: json['name'],
      field: json['field'],
      description: json['description'],
    );
  }
}
