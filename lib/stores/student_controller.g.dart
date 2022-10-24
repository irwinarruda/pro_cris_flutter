// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentController on StudentControllerBase, Store {
  Computed<bool>? _$isEditingStudentComputed;

  @override
  bool get isEditingStudent => (_$isEditingStudentComputed ??= Computed<bool>(
          () => super.isEditingStudent,
          name: 'StudentControllerBase.isEditingStudent'))
      .value;

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

  late final _$selectedStudentAtom =
      Atom(name: 'StudentControllerBase.selectedStudent', context: context);

  @override
  Student? get selectedStudent {
    _$selectedStudentAtom.reportRead();
    return super.selectedStudent;
  }

  @override
  set selectedStudent(Student? value) {
    _$selectedStudentAtom.reportWrite(value, super.selectedStudent, () {
      super.selectedStudent = value;
    });
  }

  late final _$isEditingStudentLoadingAtom = Atom(
      name: 'StudentControllerBase.isEditingStudentLoading', context: context);

  @override
  bool get isEditingStudentLoading {
    _$isEditingStudentLoadingAtom.reportRead();
    return super.isEditingStudentLoading;
  }

  @override
  set isEditingStudentLoading(bool value) {
    _$isEditingStudentLoadingAtom
        .reportWrite(value, super.isEditingStudentLoading, () {
      super.isEditingStudentLoading = value;
    });
  }

  late final _$isModalBillingOpenAtom =
      Atom(name: 'StudentControllerBase.isModalBillingOpen', context: context);

  @override
  bool get isModalBillingOpen {
    _$isModalBillingOpenAtom.reportRead();
    return super.isModalBillingOpen;
  }

  @override
  set isModalBillingOpen(bool value) {
    _$isModalBillingOpenAtom.reportWrite(value, super.isModalBillingOpen, () {
      super.isModalBillingOpen = value;
    });
  }

  late final _$listStudentsAsyncAction =
      AsyncAction('StudentControllerBase.listStudents', context: context);

  @override
  Future<void> listStudents() {
    return _$listStudentsAsyncAction.run(() => super.listStudents());
  }

  late final _$listStudentByIdAsyncAction =
      AsyncAction('StudentControllerBase.listStudentById', context: context);

  @override
  Future<void> listStudentById(String studentId) {
    return _$listStudentByIdAsyncAction
        .run(() => super.listStudentById(studentId));
  }

  late final _$StudentControllerBaseActionController =
      ActionController(name: 'StudentControllerBase', context: context);

  @override
  void setIsEditingStudentLoading(bool value) {
    final _$actionInfo = _$StudentControllerBaseActionController.startAction(
        name: 'StudentControllerBase.setIsEditingStudentLoading');
    try {
      return super.setIsEditingStudentLoading(value);
    } finally {
      _$StudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onModalBillinigOpen() {
    final _$actionInfo = _$StudentControllerBaseActionController.startAction(
        name: 'StudentControllerBase.onModalBillinigOpen');
    try {
      return super.onModalBillinigOpen();
    } finally {
      _$StudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onModalBillinigClose() {
    final _$actionInfo = _$StudentControllerBaseActionController.startAction(
        name: 'StudentControllerBase.onModalBillinigClose');
    try {
      return super.onModalBillinigClose();
    } finally {
      _$StudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
students: ${students},
selectedStudent: ${selectedStudent},
isEditingStudentLoading: ${isEditingStudentLoading},
isModalBillingOpen: ${isModalBillingOpen},
isEditingStudent: ${isEditingStudent}
    ''';
  }
}
