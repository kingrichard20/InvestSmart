import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'quiz2_widget.dart' show Quiz2Widget;
import 'package:flutter/material.dart';

class Quiz2Model extends FlutterFlowModel<Quiz2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RadioButton_2_1 widget.
  FormFieldController<String>? radioButton21ValueController;
  // State field(s) for RadioButton_2_2 widget.
  FormFieldController<String>? radioButton22ValueController;
  // State field(s) for RadioButton_2_3 widget.
  FormFieldController<String>? radioButton23ValueController;
  // State field(s) for RadioButton_2_4 widget.
  FormFieldController<String>? radioButton24ValueController;
  // State field(s) for RadioButton_2_5 widget.
  FormFieldController<String>? radioButton25ValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButton21Value => radioButton21ValueController?.value;
  String? get radioButton22Value => radioButton22ValueController?.value;
  String? get radioButton23Value => radioButton23ValueController?.value;
  String? get radioButton24Value => radioButton24ValueController?.value;
  String? get radioButton25Value => radioButton25ValueController?.value;
}
