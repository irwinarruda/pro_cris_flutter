class PlatformUser {
  String id;
  String? name;
  String email;
  String? phone;
  String? avatar;

  PlatformUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatar,
  });

  factory PlatformUser.fromJson(Map<String, dynamic> json) {
    return PlatformUser(
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
