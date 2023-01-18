// ignore_for_file: unused_field, prefer_const_constructors, no_leading_underscores_for_local_identifiers, prefer_final_fields, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing/navigator_key.dart';
import 'package:testing/screens/splash_screen.dart';
import 'package:testing/widgets/app_bar_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isDataMatched = true;
  late final String _uName;
  late final String _pword;
  late final String _userName;
  late final String _password;
  String _errorMessage = "Invalid Username or Password";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: const Text(
          "AutoGraph",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          AppBarButtons(
            buttonIcon: const Icon(Icons.search),
            buttonAction: () {},
          ),
          AppBarButtons(
            buttonIcon: const Icon(Icons.chat),
            buttonAction: () {},
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _userNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Username",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Your Username";
                } else if (_isDataMatched) {
                  return null;
                }
                // else if (_userName != savedUsername) {
                //   return "Invalid User Name";
                // }
                // else {
                //   return _errorMessage;
                // }
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              obscureText: true,
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Your Password";
                } else if (_isDataMatched) {
                  return null;
                }
                // else if (_password != savedPassword) {
                //   return "Invalid Password";
                // }
                //  else {
                //   return _errorMessage;
                // }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: !_isDataMatched,
                  child: Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      validateLogin(context);
                    } else {
                      // print(_errorMessage);
                    }
                  },
                  icon: const Icon(Icons.check),
                  label: const Text("Login"),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text("Don't you have an account? Please Sign up"),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  navigatorKey.currentState?.pushReplacementNamed("signup");
                },
                icon: const Icon(Icons.check),
                label: const Text("Signup")),
          ],
        ),
      ),
    );
  }

  void validateLogin(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    // _userName = _sharedPrefs.getString("userName")!;
    // _password = _sharedPrefs.getString("pssword")!;
    _uName = _userNameController.text;
    _pword = _passwordController.text;
    if (_uName == _pword) {
      // REDIRECT TO HOME
      // check
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);

      navigatorKey.currentState?.pushReplacementNamed("homeScreen");
    } else {
      // SnackBar
      // SnackBar(
      //   behavior: SnackBarBehavior.floating,
      //   backgroundColor: Colors.redAccent,
      //   margin: EdgeInsets.all(20),
      //   content: Text(_errorMessage),
      // );

      // AlertDialog :- Not Recommended due to Blocking the Screen
      // showDialog(
      //     context: ctx,
      //     builder: (ctx1) => AlertDialog(
      //           title: Text("Error"),
      //           content: Text(_errorMessage),
      //           actions: [
      //             TextButton(
      //               onPressed: () {
      //                 Navigator.of(ctx1).pop();
      //               },
      //               child: Text("Close"),
      //             )
      //           ],
      //         ));
      // Dynamic Alert
      setState(() {
        _isDataMatched = false;
      });
    }
  }
}
