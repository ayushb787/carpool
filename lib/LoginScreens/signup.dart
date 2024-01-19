import 'package:carpool/LoginScreens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget>
    with TickerProviderStateMixin {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final passwordController1 = TextEditingController();
  final passwordController2 = TextEditingController();
  bool passwordVisibility1 = false;
  bool passwordVisibility2 = false;
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0, 140),
          end: const Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        ),
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(-0.349, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler sScaler = ScreenScaler()..init(context);
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4B39EF), Color(0xFFEE8B60)],
            stops: [0, 1],
            begin: AlignmentDirectional(0.87, -1),
            end: AlignmentDirectional(-0.87, 1),
          ),
        ),
        alignment: const AlignmentDirectional(0, -1),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 32),
                child: Text(
                  'VIT C@rPool',
                  style: TextStyle(
                      fontSize: sScaler.getTextSize(16),
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Create Account',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: sScaler.getTextSize(16)),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 12, 0, 24),
                            child: Text(
                                'Fill out the information below in order to create your account.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: sScaler.getTextSize(11))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: nameController,
                                autofocus: false,
                                autofillHints: const [AutofillHints.email],
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                  labelStyle: TextStyle(
                                      fontSize: sScaler.getTextSize(11)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFF4B39EF),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                style: TextStyle(
                                    fontSize: sScaler.getTextSize(12)),
                                keyboardType: TextInputType.name,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: emailController,
                                autofocus: false,
                                autofillHints: const [AutofillHints.email],
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                      fontSize: sScaler.getTextSize(11)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFF4B39EF),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                style: TextStyle(
                                    fontSize: sScaler.getTextSize(12)),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: passwordController1,
                                autofocus: false,
                                autofillHints: const [AutofillHints.password],
                                obscureText: !passwordVisibility1,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                      fontSize: sScaler.getTextSize(11)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFF4B39EF),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => passwordVisibility1 =
                                          !passwordVisibility1,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      passwordVisibility1
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24,
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                    fontSize: sScaler.getTextSize(12)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: passwordController2,
                                autofocus: false,
                                autofillHints: const [AutofillHints.password],
                                obscureText: !passwordVisibility2,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  labelStyle: TextStyle(
                                      fontSize: sScaler.getTextSize(11)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFF4B39EF),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => passwordVisibility2 =
                                          !passwordVisibility2,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      passwordVisibility2
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24,
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                    fontSize: sScaler.getTextSize(12)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: FlutterFlowChoiceChips(
                              options: const [
                                ChipData('Male', FontAwesomeIcons.person),
                                ChipData('Female', FontAwesomeIcons.personDress)
                              ],
                              onChanged: (val) {
                                setState(() {
                                  choiceChipsValue = val?.first;
                                });
                              },
                              selectedChipStyle: ChipStyle(
                                backgroundColor: const Color(0xFF39D2C0),
                                textStyle: TextStyle(
                                  fontSize: sScaler.getTextSize(11),
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                                iconColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                iconSize: sScaler.getTextSize(13),
                                elevation: 4,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: TextStyle(
                                  fontSize: sScaler.getTextSize(11),
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                iconSize: sScaler.getTextSize(13),
                                elevation: 0,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              chipSpacing: 12,
                              rowSpacing: 12,
                              multiselect: false,
                              alignment: WrapAlignment.start,
                              controller: choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                [],
                              ),
                              // wrapped: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (passwordController1.text !=
                                    passwordController2.text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Passwords don\'t match!',
                                      ),
                                      backgroundColor: Colors.red,
                                      elevation: 10,
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(5),
                                    ),
                                  );
                                  return;
                                }
                                try {
                                  final user = await _auth
                                      .createUserWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController1.text);
                                  if (user.user == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Could Not Create User!',
                                        ),
                                        backgroundColor: Colors.red,
                                        elevation: 10,
                                        behavior: SnackBarBehavior.floating,
                                        margin: EdgeInsets.all(5),
                                      ),
                                    );
                                  } else {
                                    Navigator.pop(context);
                                  }
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'email-already-in-use') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'User Already in Use!',
                                        ),
                                        backgroundColor: Colors.red,
                                        elevation: 10,
                                        behavior: SnackBarBehavior.floating,
                                        margin: EdgeInsets.all(5),
                                      ),
                                    );
                                    return;
                                  } else if (e.code == 'weak-password') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Weak Password! Minimum Length - 6 Characters',
                                        ),
                                        backgroundColor: Colors.red,
                                        elevation: 10,
                                        behavior: SnackBarBehavior.floating,
                                        margin: EdgeInsets.all(5),
                                      ),
                                    );
                                    return;
                                  } else if (e.code == 'invalid-email') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Invalid Email!',
                                        ),
                                        backgroundColor: Colors.red,
                                        elevation: 10,
                                        behavior: SnackBarBehavior.floating,
                                        margin: EdgeInsets.all(5),
                                      ),
                                    );
                                    return;
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Error!!! Please Contact Owner',
                                        ),
                                        backgroundColor: Colors.red,
                                        elevation: 10,
                                        behavior: SnackBarBehavior.floating,
                                        margin: EdgeInsets.all(5),
                                      ),
                                    );
                                    return;
                                  }
                                }
                                print(
                                    "Name - ${nameController.text}, Email Id - ${emailController.text}, Password - ${passwordController1.text}, Confirm Password - ${passwordController2.text}, Gender - ${choiceChipsValueController!.value!.first}");
                                // GoRouter.of(context).prepareAuthEvent();

                                // final user = await authManager.signInWithEmail(
                                //   context,
                                //   emailAddressController1.text,
                                //   passwordController1.text,
                                // );
                                // if (user == null) {
                                //   return;
                                // }

                                // context.goNamedAuth('null', context.mounted);
                              },
                              text: 'Sign Up',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 44,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                color: const Color(0xFF4B39EF),
                                textStyle: TextStyle(
                                  fontSize: sScaler.getTextSize(11),
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                                elevation: 3,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                          ),

                          // You will have to add an action on this rich text to go to your login page.
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginWidget()));
                              },
                              child: RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Already have an account?  ',
                                      style: TextStyle(
                                          fontSize: sScaler.getTextSize(11),
                                          color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: 'Sign In here',
                                      style: TextStyle(
                                        fontSize: sScaler.getTextSize(11),
                                        fontFamily: 'Readex Pro',
                                        color: const Color(0xFF4B39EF),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                  style: TextStyle(
                                      fontSize: sScaler.getTextSize(12)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation']!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
