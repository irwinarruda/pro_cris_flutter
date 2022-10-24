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
  Student? selectedStudent;

  @observable
  bool isEditingStudentLoading = false;

  @observable
  bool isModalBillingOpen = false;

  @computed
  bool get isEditingStudent => selectedStudent != null;

  @action
  void setIsEditingStudentLoading(bool value) {
    isEditingStudentLoading = value;
  }

  @action
  void onModalBillinigOpen() {
    isModalBillingOpen = true;
  }

  @action
  void onModalBillinigClose() {
    isModalBillingOpen = false;
  }

  @action
  Future<void> listStudents() async {
    final studentsList = await _studentService.listStudents();
    if (studentsList != null) {
      students = studentsList.asObservable();
    }
  }

  @action
  Future<void> listStudentById(String studentId) async {
    final student = await _studentService.listStudentById(studentId);
    if (student != null) {
      selectedStudent = student;
    }
  }
}
