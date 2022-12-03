// ignore_for_file: unused_import, prefer_const_constructors, unnecessary_late, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing/navigator_key.dart';
import 'package:testing/screens/profile.dart';
import 'package:testing/screens/Messages.dart';
import 'package:testing/screens/requests.dart';
import 'package:testing/assets.dart';
import 'package:testing/sections/button_groupe_section.dart';
import 'package:testing/sections/status_section.dart';
import 'package:testing/widgets/app_bar_buttons.dart';
import 'package:testing/widgets/avatar.dart';
import 'package:testing/widgets/button_groupe.dart';

class FbHome extends StatefulWidget {
  const FbHome({super.key});
  @override
  State<FbHome> createState() => _FbHomeState();
}

class _FbHomeState extends State<FbHome> {
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
      body: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          StatusSection(),
          const Divider(),
          // ButtonGroupeSection(),
          const Text("Home Screen"),

          // TextButton(
          //*** Navigation with Anonymous Routing ***
          //   onPressed: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (BuildContext ctx) {
          //         return Profile();
          //       },
          //     ));
          //   },
          //   child: const Text("Profile"),
          // ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    //*** Navigation with Named Routing ***

                    // Navigator.of(context).pushNamed("profile");

                    //*** Navigation without context ***
                    navigatorKey.currentState?.pushNamed(
                      "profile",
                      // arguments: ProfileArguments(
                      //     profileName: "Renjith Raj",
                      //     profileDescription:
                      //         "Software Engineer - Flutter Developer"),
                    );
                  },
                  child: const Text("Profile")),
              TextButton(
                  onPressed: () {
                    navigatorKey.currentState?.pushNamed("createMessage");
                  },
                  child: const Text("Mesages")),
              TextButton(onPressed: () {}, child: const Text("Requests")),
              TextButton(onPressed: () {}, child: const Text("Notification")),
            ],
          ),
          TextButton(
            onPressed: () {
              logout(context);
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  // Logout Function
  void logout(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    navigatorKey.currentState
        ?.pushNamedAndRemoveUntil("login", (route) => false);
  }
}
