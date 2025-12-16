import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  Local state fields for this page.

  String editType = 'Name';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_profilePicLink = false;
  FFUploadedFile uploadedLocalFile_profilePicLink =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_profilePicLink = '';

  // State field(s) for Name-Text-Field widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  // State field(s) for Current-Password-Text-Field widget.
  FocusNode? currentPasswordTextFieldFocusNode;
  TextEditingController? currentPasswordTextFieldTextController;
  late bool currentPasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      currentPasswordTextFieldTextControllerValidator;
  // State field(s) for New-Password-Text-Field widget.
  FocusNode? newPasswordTextFieldFocusNode;
  TextEditingController? newPasswordTextFieldTextController;
  late bool newPasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      newPasswordTextFieldTextControllerValidator;
  // State field(s) for Confirm-New-Password-Text-Field widget.
  FocusNode? confirmNewPasswordTextFieldFocusNode;
  TextEditingController? confirmNewPasswordTextFieldTextController;
  late bool confirmNewPasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      confirmNewPasswordTextFieldTextControllerValidator;
  // State field(s) for Email-Text-Field widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  String? _emailTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Enter a valid email adress.';
    }
    return null;
  }

  // State field(s) for Confirm-Email-Text-Field widget.
  FocusNode? confirmEmailTextFieldFocusNode;
  TextEditingController? confirmEmailTextFieldTextController;
  String? Function(BuildContext, String?)?
      confirmEmailTextFieldTextControllerValidator;
  String? _confirmEmailTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirm Email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Enter a valid email adress.';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    currentPasswordTextFieldVisibility = false;
    newPasswordTextFieldVisibility = false;
    confirmNewPasswordTextFieldVisibility = false;
    emailTextFieldTextControllerValidator =
        _emailTextFieldTextControllerValidator;
    confirmEmailTextFieldTextControllerValidator =
        _confirmEmailTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    currentPasswordTextFieldFocusNode?.dispose();
    currentPasswordTextFieldTextController?.dispose();

    newPasswordTextFieldFocusNode?.dispose();
    newPasswordTextFieldTextController?.dispose();

    confirmNewPasswordTextFieldFocusNode?.dispose();
    confirmNewPasswordTextFieldTextController?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    confirmEmailTextFieldFocusNode?.dispose();
    confirmEmailTextFieldTextController?.dispose();
  }
}
