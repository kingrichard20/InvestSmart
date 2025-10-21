import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for su-user-name widget.
  FocusNode? suUserNameFocusNode;
  TextEditingController? suUserNameTextController;
  String? Function(BuildContext, String?)? suUserNameTextControllerValidator;
  // State field(s) for su-email widget.
  FocusNode? suEmailFocusNode;
  TextEditingController? suEmailTextController;
  String? Function(BuildContext, String?)? suEmailTextControllerValidator;
  // State field(s) for su-password widget.
  FocusNode? suPasswordFocusNode;
  TextEditingController? suPasswordTextController;
  late bool suPasswordVisibility;
  String? Function(BuildContext, String?)? suPasswordTextControllerValidator;
  // State field(s) for su-confirm-password widget.
  FocusNode? suConfirmPasswordFocusNode;
  TextEditingController? suConfirmPasswordTextController;
  late bool suConfirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      suConfirmPasswordTextControllerValidator;
  // State field(s) for su-phonenumb widget.
  FocusNode? suPhonenumbFocusNode;
  TextEditingController? suPhonenumbTextController;
  String? Function(BuildContext, String?)? suPhonenumbTextControllerValidator;
  // State field(s) for li-email widget.
  FocusNode? liEmailFocusNode;
  TextEditingController? liEmailTextController;
  String? Function(BuildContext, String?)? liEmailTextControllerValidator;
  // State field(s) for li-password widget.
  FocusNode? liPasswordFocusNode;
  TextEditingController? liPasswordTextController;
  late bool liPasswordVisibility;
  String? Function(BuildContext, String?)? liPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    suPasswordVisibility = false;
    suConfirmPasswordVisibility = false;
    liPasswordVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    suUserNameFocusNode?.dispose();
    suUserNameTextController?.dispose();

    suEmailFocusNode?.dispose();
    suEmailTextController?.dispose();

    suPasswordFocusNode?.dispose();
    suPasswordTextController?.dispose();

    suConfirmPasswordFocusNode?.dispose();
    suConfirmPasswordTextController?.dispose();

    suPhonenumbFocusNode?.dispose();
    suPhonenumbTextController?.dispose();

    liEmailFocusNode?.dispose();
    liEmailTextController?.dispose();

    liPasswordFocusNode?.dispose();
    liPasswordTextController?.dispose();
  }
}
