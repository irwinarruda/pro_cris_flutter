// ignore_for_file: non_constant_identifier_names

class Schedule {
  String id;
  String week_day;
  String day_time;
  bool isDefault;
  bool isDeleted;

  Schedule({
    required this.id,
    required this.week_day,
    required this.day_time,
    required this.isDefault,
    required this.isDeleted,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['id'],
      week_day: json['week_day'],
      day_time: json['day_time'],
      isDefault: json['is_default'],
      isDeleted: json['is_deleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'week_day': week_day,
      'day_time': day_time,
      'is_default': isDefault,
      'is_deleted': isDeleted,
    };
  }
}
