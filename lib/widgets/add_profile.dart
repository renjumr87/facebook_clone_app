// ignore_for_file: empty_constructor_bodies, unused_import, unnecessary_null_comparison, unused_field, avoid_unnecessary_containers, body_might_complete_normally_nullable, avoid_print, non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing/db/functions/db_functions.dart';
import 'package:testing/db/model/profile_model.dart';
import 'package:testing/navigator_key.dart';
import 'package:testing/screens/splash_screen.dart';
import 'package:testing/widgets/app_bar_buttons.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({super.key});
  @override
  State<AddProfile> createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  final _firstnameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  final _retypePasswordController = TextEditingController();
  final _dobController = TextEditingController();
  final _genderController = TextEditingController();
  final bool _isDataMatched = true;
  late final String _firstName;
  late final String _lastName;
  late final String _email;
  late final String _mobile;
  late final String _password;
  late final String _retypePassword;
  late final String _dob;
  late final String _gender;
  final String _errorMessage = "Fill Up All Fields";
  final _formKey = GlobalKey<FormState>();

  _AddProfileState();

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(.50),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _firstnameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "First Name",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Your First Name";
                } else {
                  return null;
                }
                // else if (_name != savedUsername) {
                //   return "Invalid User Name";
                // }
                // else {
                //   return _errorMessage;
                // }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Last Name",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Your Last Name";
                } else {
                  return null;
                }
                // else if (_lastName != savedLastName) {
                //   return "Invalid Last Name";
                // }
                //  else {
                //   return _errorMessage;
                // }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Your Email";
                } else {
                  return null;
                }
                // else if (_email != savedEmail) {
                //   return "Invalid Email";
                // }
                // else {
                //   return _errorMessage;
                // }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _mobileController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Mobile",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Mobile Number";
                } else {
                  return null;
                }
                // else if (_email != savedEmail) {
                //   return "Invalid Email";
                // }
                // else {
                //   return _errorMessage;
                // }
              },
            ),
            const SizedBox(
              height: 10,
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
                } else if (value != null) {
                  _password = _passwordController.text;
                  print(_password);
                  // return _password;
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              controller: _retypePasswordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Retype Password",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Re-enter Your Password";
                } else if (value != _password) {
                  return "Password Does not Match";
                } else if (value != null) {
                  _retypePassword = _retypePasswordController.text;
                  // _password = _retypePassword;
                  // print(_password);
                  // return _password;
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _dobController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Date of Birth",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Your Date of Birth";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _genderController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Gender",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Your Gender";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: !_isDataMatched,
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _saveDataToStorage(context);
                    }
                    // else {
                    //   print(_errorMessage);
                    // }
                  },
                  icon: const Icon(Icons.check),
                  label: const Text("Signup"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveDataToStorage(BuildContext ctx) async {
    _firstName = _firstnameController.text;
    _lastName = _lastNameController.text;
    _email = _emailController.text;
    _mobile = _mobileController.text;
    _dob = _dobController.text;
    _gender = _genderController.text;
    if (_firstName.isEmpty ||
        _lastName.isEmpty ||
        _email.isEmpty ||
        _mobile.isEmpty ||
        _password.isEmpty ||
        _dob.isEmpty ||
        _gender.isEmpty) {
      return;
    }
    // final _sharedPrefs = await SharedPreferences.getInstance();
    // await _sharedPrefs.setBool(SAVE_KEY_NAME, true);
    // navigatorKey.currentState?.pushReplacementNamed("homeScreen");
    final _Profile = ProfileModel(
        firstName: _firstName,
        lastName: _lastName,
        email: _email,
        mobile: _mobile,
        password: _password,
        dateOfBirth: _dob,
        gender: _gender,
        id: '1');
    createProfile(_Profile);
  }
}
