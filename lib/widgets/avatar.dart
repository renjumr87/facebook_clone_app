// ignore_for_file: unused_import, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:testing/assets.dart';

class Avatar extends StatefulWidget {
  final bool displayStatus;
  // final String displayImage;
  final double width;
  final double height;

  const Avatar({
    super.key,
    required this.displayStatus,
    // required this.displayImage,
    this.width = 50,
    this.height = 50,
  });

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  // late String displayImage;

  // String get displayImage => null;

  @override
  Widget build(BuildContext context) {
    Widget statusIndicator;
    if (widget.displayStatus) {
      statusIndicator = Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 15,
            height: 15,
            decoration: const BoxDecoration(
              color: Colors.greenAccent,
              shape: BoxShape.circle,
            ),
          ));
    } else {
      statusIndicator = const SizedBox();
    }

    return Stack(
      children: <Widget>[
        Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              shape: BoxShape.circle,
            )

            //  ClipRRect(
            //   borderRadius: BorderRadius.circular(100),
            //   child:
            //   Image.asset(
            //     displayImage,
            //   ),
            // ),
            ),
        statusIndicator,
      ],
    );
  }
}
