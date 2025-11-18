import '/components/compound_example/compound_example_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chapter1_widget.dart' show Chapter1Widget;
import 'package:flutter/material.dart';

class Chapter1Model extends FlutterFlowModel<Chapter1Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for CompoundExample component.
  late CompoundExampleModel compoundExampleModel;

  @override
  void initState(BuildContext context) {
    compoundExampleModel = createModel(context, () => CompoundExampleModel());
  }

  @override
  void dispose() {
    compoundExampleModel.dispose();
  }
}
