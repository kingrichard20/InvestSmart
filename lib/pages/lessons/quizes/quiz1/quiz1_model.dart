import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'quiz1_widget.dart' show Quiz1Widget;
import 'package:flutter/material.dart';

class Quiz1Model extends FlutterFlowModel<Quiz1Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RadioButton_1_1 widget.
  FormFieldController<String>? radioButton11ValueController;
  // State field(s) for RadioButton_1_2 widget.
  FormFieldController<String>? radioButton12ValueController;
  // State field(s) for RadioButton_1_3 widget.
  FormFieldController<String>? radioButton13ValueController;
  // State field(s) for RadioButton_1_4 widget.
  FormFieldController<String>? radioButton14ValueController;
  // State field(s) for RadioButton_1_5 widget.
  FormFieldController<String>? radioButton15ValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButton11Value => radioButton11ValueController?.value;
  String? get radioButton12Value => radioButton12ValueController?.value;
  String? get radioButton13Value => radioButton13ValueController?.value;
  String? get radioButton14Value => radioButton14ValueController?.value;
  String? get radioButton15Value => radioButton15ValueController?.value;
}
