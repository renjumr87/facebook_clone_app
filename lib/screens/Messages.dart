// ignore_for_file: unused_import, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:testing/assets.dart';
import 'package:testing/sections/button_groupe_section.dart';
import 'package:testing/sections/status_section.dart';
import 'package:testing/widgets/app_bar_buttons.dart';
import 'package:testing/widgets/avatar.dart';
import 'package:testing/widgets/button_groupe.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});
  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final messageItemCount = 10;
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
          StatusSection(),
          Divider(),
          // ButtonGroupeSection(),
          const Text("Message Screen"),
          Row(
            children: [
              TextButton(onPressed: () {}, child: const Text("Profile")),
              TextButton(onPressed: () {}, child: const Text("Mesages")),
              TextButton(onPressed: () {}, child: const Text("Requests")),
            ],
          ),
          // ListView.separated(
          //   itemBuilder: (ctx, index) {
          //     return ListTile(
          //       leading: Avatar(displayStatus: true),
          //       title: Text("ProfileName"),
          //       subtitle: Text("Message Content"),
          //       trailing: Text("$index"),
          //     );
          //   },
          //   separatorBuilder: (ctx, index) {
          //     return Divider();
          //   },
          //   itemCount: messageItemCount,
          // ),
        ],
      ),
    );
  }
}
