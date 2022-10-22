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

  late final _$StudentControllerBaseActionController =
      ActionController(name: 'StudentControllerBase', context: context);

  @override
  void onModalBillingOpen() {
    final _$actionInfo = _$StudentControllerBaseActionController.startAction(
        name: 'StudentControllerBase.onModalBillingOpen');
    try {
      return super.onModalBillingOpen();
    } finally {
      _$StudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onModalBillingClose() {
    final _$actionInfo = _$StudentControllerBaseActionController.startAction(
        name: 'StudentControllerBase.onModalBillingClose');
    try {
      return super.onModalBillingClose();
    } finally {
      _$StudentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
students: ${students},
isModalBillingOpen: ${isModalBillingOpen}
    ''';
  }
}
