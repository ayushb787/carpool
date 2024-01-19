import 'package:carpool/LoginScreens/login.dart';

import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget>
    with TickerProviderStateMixin {
  static const String KEYLOGIN = "login";

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(const Duration(seconds: 2), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => SelectServiceWidget()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginWidget()));
        }
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginWidget()));
      }
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(3, 3),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 300.ms,
          duration: 300.ms,
          begin: const Offset(0.6, 0.6),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 350.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 350.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 350.ms,
          duration: 400.ms,
          begin: const Offset(0, 30),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 400.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 400.ms,
          begin: const Offset(0, 30),
          end: const Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    whereToGo();
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 500,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF4B39EF),
                    Color(0xFFFF5963),
                    Color(0xFFEE8B60),
                  ],
                  stops: [0, 0.5, 1],
                  begin: AlignmentDirectional(-1, -1),
                  end: AlignmentDirectional(1, 1),
                ),
              ),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0x00FFFFFF),
                      FlutterFlowTheme.of(context).secondaryBackground
                    ],
                    stops: const [0, 1],
                    begin: const AlignmentDirectional(0, -1),
                    end: const AlignmentDirectional(0, 1),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Color(0xFFCCFFFFFF),
                        shape: BoxShape.circle,
                      ),
                      child: const Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: FaIcon(
                          FontAwesomeIcons.carRear,
                          color: Color(0xFFEE8B60),
                          size: 75,
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation2']!),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                      child: Text(
                        'VIT C@rPool',
                        style: TextStyle(
                            fontSize: sScaler.getTextSize(16),
                            fontFamily: 'Outfit',
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation1']!),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(44, 8, 44, 0),
                      child: Text('Thanks for joining! Let\'s get Started!',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: sScaler.getTextSize(11)))
                          .animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation2']!),
                    ),
                  ],
                ),
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation1']!),
          ),
        ],
      ),
    );
  }
}
