import '/flutter_flow/flutter_flow_util.dart';
import 'modal_assign_training_widget.dart' show ModalAssignTrainingWidget;
import 'package:flutter/material.dart';

class ModalAssignTrainingModel
    extends FlutterFlowModel<ModalAssignTrainingWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  /// Initialization and disposal methods.
  void initState(BuildContext context) {}

  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }


}
