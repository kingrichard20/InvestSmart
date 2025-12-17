import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'quiz4_widget.dart' show Quiz4Widget;
import 'package:flutter/material.dart';

class Quiz4Model extends FlutterFlowModel<Quiz4Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RadioButton_4_1 widget.
  FormFieldController<String>? radioButton41ValueController;
  // State field(s) for RadioButton_4_2 widget.
  FormFieldController<String>? radioButton42ValueController;
  // State field(s) for RadioButton_4_3 widget.
  FormFieldController<String>? radioButton43ValueController;
  // State field(s) for RadioButton_4_4 widget.
  FormFieldController<String>? radioButton44ValueController;
  // State field(s) for RadioButton_4_5 widget.
  FormFieldController<String>? radioButton45ValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButton41Value => radioButton41ValueController?.value;
  String? get radioButton42Value => radioButton42ValueController?.value;
  String? get radioButton43Value => radioButton43ValueController?.value;
  String? get radioButton44Value => radioButton44ValueController?.value;
  String? get radioButton45Value => radioButton45ValueController?.value;
}
