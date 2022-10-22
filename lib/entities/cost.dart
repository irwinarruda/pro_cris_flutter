// ignore_for_file: non_constant_identifier_names

class Cost {
  String id;
  String time;
  String price;
  bool isDefault;
  bool isDeleted;

  Cost({
    required this.id,
    required this.time,
    required this.price,
    required this.isDefault,
    required this.isDeleted,
  });

  factory Cost.fromJson(Map<String, dynamic> json) {
    return Cost(
      id: json['id'],
      time: json['time'],
      price: json['price'],
      isDefault: json['is_default'],
      isDeleted: json['is_deleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'time': time,
      'price': price,
      'is_default': isDefault,
      'is_deleted': isDeleted,
    };
  }
}
