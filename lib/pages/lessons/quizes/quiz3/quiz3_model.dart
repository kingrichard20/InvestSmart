import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'quiz3_widget.dart' show Quiz3Widget;
import 'package:flutter/material.dart';

class Quiz3Model extends FlutterFlowModel<Quiz3Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RadioButton_3_1 widget.
  FormFieldController<String>? radioButton31ValueController;
  // State field(s) for RadioButton_3_2 widget.
  FormFieldController<String>? radioButton32ValueController;
  // State field(s) for RadioButton_3_3 widget.
  FormFieldController<String>? radioButton33ValueController;
  // State field(s) for RadioButton_3_4 widget.
  FormFieldController<String>? radioButton34ValueController;
  // State field(s) for RadioButton_3_5 widget.
  FormFieldController<String>? radioButton35ValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButton31Value => radioButton31ValueController?.value;
  String? get radioButton32Value => radioButton32ValueController?.value;
  String? get radioButton33Value => radioButton33ValueController?.value;
  String? get radioButton34Value => radioButton34ValueController?.value;
  String? get radioButton35Value => radioButton35ValueController?.value;
}
