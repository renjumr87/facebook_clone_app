// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:testing/assets.dart';
import 'package:testing/sections/button_groupe_section.dart';
import 'package:testing/sections/status_section.dart';
import 'package:testing/widgets/app_bar_buttons.dart';
import 'package:testing/widgets/avatar.dart';
import 'package:testing/widgets/button_groupe.dart';

// class ProfileArguments {
//   final String profileName;
//   final String profileDescription;

//   ProfileArguments(
//       {required this.profileName, required this.profileDescription});
// }

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // final arguments =
    //     ModalRoute.of(context)!.settings.arguments as ProfileArguments;
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
        body: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            StatusSection(),
            Divider(),
            // ButtonGroupeSection(),
            // Text(arguments.profileName),
            // Text(arguments.profileDescription),
            Row(
              children: [
                TextButton(onPressed: () {}, child: const Text("Profile")),
                TextButton(onPressed: () {}, child: const Text("Mesages")),
                TextButton(onPressed: () {}, child: const Text("Requests")),
              ],
            ),
          ],
        ));
  }
}
