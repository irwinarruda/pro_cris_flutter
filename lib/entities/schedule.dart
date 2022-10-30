// ignore_for_file: non_constant_identifier_names

class Schedule {
  String id;
  String weekDay;
  String dayTime;
  bool isDefault;
  bool isDeleted;

  Schedule({
    required this.id,
    required this.weekDay,
    required this.dayTime,
    required this.isDefault,
    required this.isDeleted,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['id'],
      weekDay: json['week_day'],
      dayTime: json['day_time'],
      isDefault: json['is_default'],
      isDeleted: json['is_deleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'week_day': weekDay,
      'day_time': dayTime,
      'is_default': isDefault,
      'is_deleted': isDeleted,
    };
  }
}
