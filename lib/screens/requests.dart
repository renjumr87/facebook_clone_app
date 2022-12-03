// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:testing/screens/fb_home.dart';
import 'package:testing/screens/profile.dart';
import 'package:testing/screens/requests.dart';
import 'package:testing/assets.dart';
import 'package:testing/sections/button_groupe_section.dart';
import 'package:testing/sections/status_section.dart';
import 'package:testing/widgets/app_bar_buttons.dart';
import 'package:testing/widgets/avatar.dart';
import 'package:testing/widgets/button_groupe.dart';

class Requests extends StatefulWidget {
  const Requests({super.key});
  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          backgroundColor: Colors.white70,
          title: const Text(
            "facebook",
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
            // StatusSection(),
            Divider(),
            // ButtonGroupeSection(),
            const Text("Requests Screen"),
            TextButton(onPressed: () {}, child: const Text("Profile")),
            TextButton(onPressed: () {}, child: const Text("Mesages")),
            TextButton(onPressed: () {}, child: const Text("Requests")),
          ],
        ));
  }
}
