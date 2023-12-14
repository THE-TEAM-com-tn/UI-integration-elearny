import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'register_page_widget.dart' show RegisterPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterPageModel extends FlutterFlowModel<RegisterPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailAddressField widget.
  FocusNode? emailAddressFieldFocusNode1;
  TextEditingController? emailAddressFieldController1;
  String? Function(BuildContext, String?)?
      emailAddressFieldController1Validator;
  // State field(s) for EmailAddressField widget.
  FocusNode? emailAddressFieldFocusNode2;
  TextEditingController? emailAddressFieldController2;
  String? Function(BuildContext, String?)?
      emailAddressFieldController2Validator;
  // State field(s) for EmailAddressField widget.
  FocusNode? emailAddressFieldFocusNode3;
  TextEditingController? emailAddressFieldController3;
  String? Function(BuildContext, String?)?
      emailAddressFieldController3Validator;
  // State field(s) for EmailAddressField widget.
  FocusNode? emailAddressFieldFocusNode4;
  TextEditingController? emailAddressFieldController4;
  String? Function(BuildContext, String?)?
      emailAddressFieldController4Validator;
  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode1;
  TextEditingController? passwordFieldController1;
  late bool passwordFieldVisibility1;
  String? Function(BuildContext, String?)? passwordFieldController1Validator;
  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode2;
  TextEditingController? passwordFieldController2;
  late bool passwordFieldVisibility2;
  String? Function(BuildContext, String?)? passwordFieldController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordFieldVisibility1 = false;
    passwordFieldVisibility2 = false;
  }

  void dispose() {
    unfocusNode.dispose();
    emailAddressFieldFocusNode1?.dispose();
    emailAddressFieldController1?.dispose();

    emailAddressFieldFocusNode2?.dispose();
    emailAddressFieldController2?.dispose();

    emailAddressFieldFocusNode3?.dispose();
    emailAddressFieldController3?.dispose();

    emailAddressFieldFocusNode4?.dispose();
    emailAddressFieldController4?.dispose();

    passwordFieldFocusNode1?.dispose();
    passwordFieldController1?.dispose();

    passwordFieldFocusNode2?.dispose();
    passwordFieldController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
