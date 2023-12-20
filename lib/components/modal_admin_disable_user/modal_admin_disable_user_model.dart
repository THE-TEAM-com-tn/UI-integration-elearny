import '/flutter_flow/flutter_flow_util.dart';
import 'modal_admin_disable_user_widget.dart' show ModalAdminDisableUserWidget;
import 'package:flutter/material.dart';

class ModalAdminDisableUserModel
    extends FlutterFlowModel<ModalAdminDisableUserWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
