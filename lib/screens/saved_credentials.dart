import 'package:flutter/material.dart';

class SavedCredentials extends StatefulWidget {
  const SavedCredentials({super.key});
  @override
  State<SavedCredentials> createState() => _SavedCredentialsState();
}

class _SavedCredentialsState extends State<SavedCredentials> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx, index) {
        return ListTile(
          title: Text("First Name$index"),
          subtitle: Text("Last Name$index"),
        );
      },
      separatorBuilder: (ctx, index) {
        return const Divider();
      },
      itemCount: 50,
    );
  }
}
