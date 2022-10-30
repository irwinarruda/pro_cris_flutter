import 'package:mobx/mobx.dart';
import 'package:pro_cris_flutter/entities/student.dart';
import 'package:pro_cris_flutter/services/student_service.dart';

part 'student_controller.g.dart';

class StudentController = StudentControllerBase with _$StudentController;

abstract class StudentControllerBase with Store {
  StudentControllerBase() {
    _studentService = StudentService.getInstance();
  }

  late StudentService _studentService;

  @observable
  ObservableList<Student> students = ObservableList.of([]);

  @observable
  String? studentId;

  @observable
  Student? student;

  @action
  void setStudentId(String id) {
    studentId = id;
  }

  @action
  void resetStudentId() {
    studentId = null;
  }

  @action
  Future<void> listStudents() async {
    final studentsList = await _studentService.listStudents();
    if (studentsList != null) {
      students = studentsList.asObservable();
    }
  }

  @action
  Future<void> getManageStudent() async {
    if (studentId == null) {
      return;
    }
    final selected = await _studentService.listStudentById(
      studentId!,
      hasCosts: true,
      hasSchedules: true,
    );
    if (selected != null) {
      student = selected;
    }
  }
}
