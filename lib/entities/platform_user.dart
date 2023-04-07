class ProCrisUser {
  String id;
  String? name;
  String email;
  String? phone;
  String? avatar;

  ProCrisUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatar,
  });

  factory ProCrisUser.fromJson(Map<String, dynamic> json) {
    return ProCrisUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
    };
  }
}
