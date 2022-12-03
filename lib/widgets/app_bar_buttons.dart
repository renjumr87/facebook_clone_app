import 'package:flutter/material.dart';

class AppBarButtons extends StatefulWidget {
  final Icon buttonIcon;
  final void Function() buttonAction;
  const AppBarButtons({
    super.key,
    required this.buttonIcon,
    required this.buttonAction,
  });

  @override
  State<AppBarButtons> createState() => _AppBarButtonsState();
}

class _AppBarButtonsState extends State<AppBarButtons> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.buttonAction,
      icon: widget.buttonIcon,
    );
  }
}
