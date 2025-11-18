import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_profilePicLink = false;
  FFUploadedFile uploadedLocalFile_profilePicLink =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_profilePicLink = '';

  // State field(s) for ChangeNameField widget.
  FocusNode? changeNameFieldFocusNode;
  TextEditingController? changeNameFieldTextController;
  String? Function(BuildContext, String?)?
      changeNameFieldTextControllerValidator;
  // State field(s) for ChangeEmailField widget.
  FocusNode? changeEmailFieldFocusNode;
  TextEditingController? changeEmailFieldTextController;
  String? Function(BuildContext, String?)?
      changeEmailFieldTextControllerValidator;
  // State field(s) for PasswordResetField widget.
  FocusNode? passwordResetFieldFocusNode;
  TextEditingController? passwordResetFieldTextController;
  late bool passwordResetFieldVisibility;
  String? Function(BuildContext, String?)?
      passwordResetFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordResetFieldVisibility = false;
  }

  @override
  void dispose() {
    changeNameFieldFocusNode?.dispose();
    changeNameFieldTextController?.dispose();

    changeEmailFieldFocusNode?.dispose();
    changeEmailFieldTextController?.dispose();

    passwordResetFieldFocusNode?.dispose();
    passwordResetFieldTextController?.dispose();
  }
}
