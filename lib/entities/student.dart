// ignore_for_file: non_constant_identifier_names

import 'package:pro_cris_flutter/entities/cost.dart';
import 'package:pro_cris_flutter/entities/schedule.dart';

class Student {
  String id;
  String name;
  String nameCaregiver;
  String phone;
  String? avatar;
  String dateOfBirth;
  String address;
  String mapLocation;
  String observation;
  String color;
  bool isDeleted;
  List<Schedule>? schedules;
  List<Cost>? costs;
  // List<Appointment> appointments;

  Student({
    required this.id,
    required this.name,
    required this.nameCaregiver,
    required this.phone,
    required this.dateOfBirth,
    required this.address,
    required this.mapLocation,
    required this.observation,
    required this.color,
    required this.isDeleted,
    this.avatar,
    this.schedules,
    this.costs,
    // required this.appointments,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      nameCaregiver: json['name_caregiver'],
      phone: json['phone'],
      avatar: json['avatar'],
      dateOfBirth: json['date_of_birth'],
      address: json['address'],
      mapLocation: json['map_location'],
      observation: json['observation'],
      color: json['color'],
      isDeleted: json['is_deleted'],
      schedules: json['schedules'] != null
          ? List.from(json['schedules'])
              .toList()
              .map((e) => Schedule.fromJson(e))
              .toList()
          : null,
      costs: json['costs'] != null
          ? List.from(json['costs'])
              .toList()
              .map((e) => Cost.fromJson(e))
              .toList()
          : null,
      // appointments: json['appointments'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'name_caregiver': nameCaregiver,
      'phone': phone,
      'avatar': avatar,
      'date_of_birth': dateOfBirth,
      'address': address,
      'map_location': mapLocation,
      'observation': observation,
      'color': color,
      'is_deleted': isDeleted,
      'schedules': schedules?.map((e) => e.toJson()).toList(),
      'costs': costs?.map((e) => e.toJson()).toList(),
      // 'appointments': appointments,
    };
  }
}
