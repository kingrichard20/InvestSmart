import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'compound_example_model.dart';
export 'compound_example_model.dart';

/// Create a data table using historical averages of S&P 500: 7% annual and
/// HYSA: 2% average long-term APY to show how $100 invested in both grows
/// over 20, 30, 40, and 50 years accounting for inflation.
class CompoundExampleWidget extends StatefulWidget {
  const CompoundExampleWidget({super.key});

  @override
  State<CompoundExampleWidget> createState() => _CompoundExampleWidgetState();
}

class _CompoundExampleWidgetState extends State<CompoundExampleWidget> {
  late CompoundExampleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompoundExampleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
    );
  }
}
