// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing/navigator_key.dart';

// ignore: constant_identifier_names
const SAVE_KEY_NAME = "UserLOggedIn";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text(
          "AutoGraph",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

Future<void> gotoLogin() async {
  await Future.delayed(Duration(milliseconds: 3000));
  navigatorKey.currentState?.pushReplacementNamed("login");
}

Future<void> checkUserLoggedIn() async {
  final _sharedprefs = await SharedPreferences.getInstance();
  final _userLoggedIn = _sharedprefs.getBool(SAVE_KEY_NAME);
  if (_userLoggedIn == null || _userLoggedIn == false) {
    gotoLogin();
  } else {
    navigatorKey.currentState?.pushReplacementNamed("homeScreen");
  }
}
