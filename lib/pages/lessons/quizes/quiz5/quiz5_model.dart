import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'quiz5_widget.dart' show Quiz5Widget;
import 'package:flutter/material.dart';

class Quiz5Model extends FlutterFlowModel<Quiz5Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RadioButton_5_1 widget.
  FormFieldController<String>? radioButton51ValueController;
  // State field(s) for RadioButton_5_2 widget.
  FormFieldController<String>? radioButton52ValueController;
  // State field(s) for RadioButton_5_3 widget.
  FormFieldController<String>? radioButton53ValueController;
  // State field(s) for RadioButton_5_4 widget.
  FormFieldController<String>? radioButton54ValueController;
  // State field(s) for RadioButton_5_5 widget.
  FormFieldController<String>? radioButton55ValueController;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButton51Value => radioButton51ValueController?.value;
  String? get radioButton52Value => radioButton52ValueController?.value;
  String? get radioButton53Value => radioButton53ValueController?.value;
  String? get radioButton54Value => radioButton54ValueController?.value;
  String? get radioButton55Value => radioButton55ValueController?.value;
}
