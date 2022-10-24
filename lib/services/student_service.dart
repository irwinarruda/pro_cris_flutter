import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_cris_flutter/entities/student.dart';
import 'package:pro_cris_flutter/services/auth_service.dart';

class StudentService {
  static final StudentService _instance = StudentService();
  static StudentService getInstance() => _instance;

  final _authService = AuthService.getInstance();
  final _firestore = FirebaseFirestore.instance;

  Future<List<Student>?> listStudents({
    bool hasSchedules = false,
    bool hasCosts = false,
    bool hasAppointments = false,
  }) async {
    if (_authService.currentPlatformUser == null) {
      // Maybe throw an error
      return null;
    }
    final studentColl = _firestore
        .collection('users')
        .doc(_authService.currentPlatformUser!.id)
        .collection('students');

    List<Student> students = [];
    final studentSnp = await studentColl.orderBy('name').get();

    for (var doc in studentSnp.docs) {
      final data = doc.data();
      final mapObj = {'id': doc.id, ...data};
      if (hasCosts) {
        final costs = await getCollectionJsonList(
          doc.reference.collection('costs'),
        );
        mapObj['costs'] = costs;
      }
      if (hasSchedules) {
        final schedules = await getCollectionJsonList(
          doc.reference.collection('schedules'),
        );
        mapObj['schedules'] = schedules;
      }
      // Appointments is missing
      students.add(Student.fromJson(mapObj));
    }

    return students.where((student) => !student.isDeleted).toList();
  }

  Future<Student?> listStudentById(
    String studentId, {
    bool hasSchedules = false,
    bool hasAppointments = false,
    bool hasCosts = false,
  }) async {
    if (_authService.currentPlatformUser == null) {
      // Maybe throw an error
      return null;
    }

    final studentDocPath = _firestore
        .collection('users')
        .doc(_authService.currentPlatformUser!.id)
        .collection('students')
        .doc(studentId);

    final studentDoc = await studentDocPath.get();
    if (!studentDoc.exists) {
      // Maybe throw an error
      return null;
    }

    final mapObj = {'id': studentDoc.id, ...?studentDoc.data()};

    if (hasCosts) {
      final costs = await getCollectionJsonList(
        studentDoc.reference.collection('costs'),
      );
      mapObj['costs'] = costs;
    }
    if (hasSchedules) {
      final schedules = await getCollectionJsonList(
        studentDoc.reference.collection('schedules'),
      );
      mapObj['schedules'] = schedules;
    }

    return Student.fromJson(mapObj);
  }

  Future<List<Map<String, dynamic>>> getCollectionJsonList(
    CollectionReference<Map<String, dynamic>> ref,
  ) async {
    final snapshot = await ref.get();
    List<Map<String, dynamic>> entities = [];
    for (var cDocs in snapshot.docs) {
      final data = cDocs.data();
      entities.add({'id': cDocs.id, ...data});
    }
    return entities;
  }
}
