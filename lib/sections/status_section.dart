// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_constructors_in_immutables, duplicate_ignore

import 'dart:ui';

import 'package:flutter/material.dart';
import '../assets.dart';
import '../widgets/avatar.dart';

class StatusSection extends StatefulWidget {
  StatusSection({super.key});

  @override
  State<StatusSection> createState() => _StatusSectionState();
}

class _StatusSectionState extends State<StatusSection> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return ListTile(
      leading: Avatar(
        displayStatus: true,
        // displayImage: avatar,
      ),
      title: TextField(
        // controller: textController,
        decoration: InputDecoration(
          hintText: "What's on your mind?",
          hintStyle: TextStyle(
            color: Colors.black87,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
