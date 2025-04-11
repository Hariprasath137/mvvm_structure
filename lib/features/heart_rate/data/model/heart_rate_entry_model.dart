class HeartRateEntry {
  final String bpm;
  final String status;
  final String activity;
  final String timestamp;

  HeartRateEntry({
    required this.bpm,
    required this.status,
    required this.activity,
    required this.timestamp,
  });

  factory HeartRateEntry.fromJson(Map<String, dynamic> json) {
    return HeartRateEntry(
      bpm: json['bpm'],
      status: json['status'],
      activity: json['activity'],
      timestamp: json['timestamp'],
    );
  }
}
