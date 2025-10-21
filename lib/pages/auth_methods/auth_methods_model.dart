import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'auth_methods_widget.dart' show AuthMethodsWidget;
import 'package:flutter/material.dart';

class AuthMethodsModel extends FlutterFlowModel<AuthMethodsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for AuthTabBar widget.
  TabController? authTabBarController;
  int get authTabBarCurrentIndex =>
      authTabBarController != null ? authTabBarController!.index : 0;
  int get authTabBarPreviousIndex =>
      authTabBarController != null ? authTabBarController!.previousIndex : 0;

  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldTextController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordFieldVisibility = false;
  }

  @override
  void dispose() {
    authTabBarController?.dispose();
    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldTextController?.dispose();
  }
}
