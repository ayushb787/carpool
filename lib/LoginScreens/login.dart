import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:carpool/LoginScreens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'google_sign_in.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with TickerProviderStateMixin {
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
          begin: Offset(0, 140),
          end: Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.9, 0.9),
          end: Offset(1, 1),
        ),
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(-0.349, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  final _auth = FirebaseAuth.instance;
  final GoogleSignInHelper _googleSignInHelper = GoogleSignInHelper();
  final emailAddressController = TextEditingController();
  final emailAddressFocusNode = FocusNode();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();
  bool passwordVisibility = false;
  String? Function(BuildContext, String?)? passwordControllerValidator;

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
                            'Welcome Back',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: sScaler.getTextSize(16)),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 12, 0, 24),
                            child: Text(
                                'Fill out the information below in order to access your account.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: sScaler.getTextSize(11))),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 16),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: emailAddressController,
                                focusNode: emailAddressFocusNode,
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 16),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: passwordController,
                                focusNode: passwordFocusNode,
                                autofocus: false,
                                autofillHints: const [AutofillHints.password],
                                obscureText: !passwordVisibility,
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
                                      () => passwordVisibility =
                                          !passwordVisibility,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      passwordVisibility
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 16),
                            child: FFButtonWidget(
                              onPressed: () async {
                                try {
                                  final user =
                                      await _auth.signInWithEmailAndPassword(
                                          email: emailAddressController.text,
                                          password: passwordController.text);
                                  if (user.user != null) {
                                    var sharedPref =
                                        await SharedPreferences.getInstance();
                                    // sharedPref.setBool(
                                    //     SplashScreenState.KEYLOGIN, true);
                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             const SelectServiceWidget()));
                                  }
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Invalid Credentials',
                                        ),
                                        backgroundColor: Colors.red,
                                        elevation: 10,
                                        behavior: SnackBarBehavior.floating,
                                        margin: EdgeInsets.all(5),
                                      ),
                                    );
                                    return;
                                  } else if (e.code == 'user-disabled') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'User Disabled! Contact Owner',
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
                                  } else if (e.code == 'too-many-requests') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Too Many Requests! Try After Some Time',
                                        ),
                                        backgroundColor: Colors.red,
                                        elevation: 10,
                                        behavior: SnackBarBehavior.floating,
                                        margin: EdgeInsets.all(5),
                                      ),
                                    );
                                    return;
                                  } else if (e.code ==
                                      'network-request-failed') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Network Request Failed',
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
                                // GoRouter.of(context).prepareAuthEvent();

                                // final user = await authManager.signInWithEmail(
                                //   context,
                                //   emailAddressController.text,
                                //   passwordController.text,
                                // );
                                // if (user == null) {
                                //   return;
                                // }

                                // context.goNamedAuth('null', context.mounted);
                              },
                              text: 'Sign In',
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16, 0, 16, 24),
                            child: Text(
                              'Or sign in with',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: sScaler.getTextSize(11)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 16),
                            child: FFButtonWidget(
                              onPressed: () async {
                                User? user = await _googleSignInHelper
                                    .signInWithGoogle();
                                if (user != null) {
                                  var sharedPref =
                                      await SharedPreferences.getInstance();
                                  // sharedPref.setBool(
                                  //     SplashScreenState.KEYLOGIN, true);
                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const SelectServiceWidget()));
                                  print(
                                      'Logged in with Google: ${user.displayName}');
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Failed to Sign In with Google',
                                      ),
                                      backgroundColor: Colors.red,
                                      elevation: 10,
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(5),
                                    ),
                                  );
                                  print(
                                      'Sign-in with Google canceled or failed.');
                                }
                              },
                              text: 'Continue with Google',
                              icon: FaIcon(
                                FontAwesomeIcons.google,
                                size: sScaler.getTextSize(12),
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 44,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: TextStyle(
                                  fontSize: sScaler.getTextSize(11),
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                                elevation: 0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2,
                                ),
                                borderRadius: 12,
                                // hoverColor: FlutterFlowTheme.of(context)
                                //     .primaryBackground,
                              ),
                            ),
                          ),
                          isAndroid
                              ? Container()
                              : Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      // GoRouter.of(context).prepareAuthEvent();
                                      // final user = await authManager
                                      //     .signInWithApple(context);
                                      // if (user == null) {
                                      //   return;
                                      // }

                                      // context.goNamedAuth(
                                      //     'null', context.mounted);
                                    },
                                    text: 'Continue with Apple',
                                    icon: FaIcon(
                                      FontAwesomeIcons.apple,
                                      size: sScaler.getTextSize(12),
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 44,
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      textStyle: TextStyle(
                                        fontSize: sScaler.getTextSize(11),
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                      elevation: 0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2,
                                      ),
                                      borderRadius: 12,
                                      // hoverColor: FlutterFlowTheme.of(context)
                                      //     .primaryBackground,
                                    ),
                                  ),
                                ),

                          // You will have to add an action on this rich text to go to your login page.
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 12, 0, 12),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpWidget()));
                              },
                              child: RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Don\'t have an account?  ',
                                      style: TextStyle(
                                        fontSize: sScaler.getTextSize(11),
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Sign Up here',
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
