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
  bool isModalBillingOpen = false;

  @action
  void onModalBillingOpen() {
    isModalBillingOpen = true;
  }

  @action
  void onModalBillingClose() {
    isModalBillingOpen = false;
  }

  @action
  Future<void> listStudents() async {
    final studentsList = await _studentService.listStudents();
    if (studentsList != null) {
      students = studentsList.asObservable();
    }
  }
}
