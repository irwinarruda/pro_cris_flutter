// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentController on StudentControllerBase, Store {
  late final _$studentsAtom =
      Atom(name: 'StudentControllerBase.students', context: context);

  @override
  ObservableList<Student> get students {
    _$studentsAtom.reportRead();
    return super.students;
  }

  @override
  set students(ObservableList<Student> value) {
    _$studentsAtom.reportWrite(value, super.students, () {
      super.students = value;
    });
  }

  late final _$studentIdAtom =
      Atom(name: 'StudentControllerBase.studentId', context: context);

  @override
  String? get studentId {
    _$studentIdAtom.reportRead();
    return super.studentId;
  }

  @override
  set studentId(String? value) {
    _$studentIdAtom.reportWrite(value, super.studentId, () {
      super.studentId = value;
    });
  }

  late final _$studentAtom =
      Atom(name: 'StudentControllerBase.student', context: context);

  @override
  Student? get student {
    _$studentAtom.reportRead();
    return super.student;
  }

  @override
  set student(Student? value) {
    _$studentAtom.reportWrite(value, super.student, () {
      super.student = value;
    });
  }

  late final _$listStudentsAsyncAction =
      AsyncAction('StudentControllerBase.listStudents', context: context);

  @override
  Future<void> listStudents() {
    return _$listStudentsAsyncAction.run(() => super.listStudents());
  }

  late final _$getManageStudentAsyncAction =
      AsyncAction('StudentControllerBase.getManageStudent', context: context);

  @override
  Future<void> getManageStudent() {
    return _$getManageStudentAsyncAction.run(() => super.getManageStudent());
  }

  late final _$deleteStudentConstAsyncAction =
      AsyncAction('StudentControllerBase.deleteStudentConst', context: context);

  @override
  Future<void> deleteStudentConst(String id) {
    return _$deleteStudentConstAsyncAction
        .run(() => super.deleteStudentConst(id));
  }

  late final _$StudentControllerBaseActionController =
      ActionController(name: 'StudentControllerBase', context: context);

  @override
  void setStudentId(String id) {
    final _$actionInfo = _$StudentControllerBaseActionController.startAction(
        name: 'StudentControllerBase.setStudentId');
    try {
      return super.setStudentId(id);
    } finally {
      _$StudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetStudentId() {
    final _$actionInfo = _$StudentControllerBaseActionController.startAction(
        name: 'StudentControllerBase.resetStudentId');
    try {
      return super.resetStudentId();
    } finally {
      _$StudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
students: ${students},
studentId: ${studentId},
student: ${student}
    ''';
  }
}
