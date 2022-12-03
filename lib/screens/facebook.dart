// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:testing/navigator_key.dart';
import 'package:testing/screens/create_message.dart';
import 'package:testing/screens/login.dart';
import 'package:testing/screens/Messages.dart';
import 'package:testing/screens/profile.dart';
import 'package:testing/screens/requests.dart';
import 'package:testing/screens/fb_home.dart';
import 'package:testing/screens/signup.dart';
import 'package:testing/screens/splash_screen.dart';

class Facebook extends StatefulWidget {
  const Facebook({super.key});

  @override
  State<Facebook> createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      navigatorKey: navigatorKey,
      routes: {
        "signup": (BuildContext ctx) => const SignUpScreen(),
        "splashScreen": (BuildContext ctx) => const SplashScreen(),
        "homeScreen": (BuildContext ctx) => const FbHome(),
        "profile": (BuildContext ctx) => const Profile(),
        "messages": (BuildContext ctx) => const Messages(),
        "requests": (BuildContext ctx) => const Requests(),
        "login": (BuildContext ctx) => const LoginScreen(),
        "createMessage": (BuildContext ctx) => const CreateMessage(),
      },
      initialRoute: "splashScreen",
    );
  }
}
