import 'package:flutter/material.dart';

class MyAlertBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const MyAlertBox({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      content: TextField(
        controller: controller,
        style: const TextStyle(),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primaryContainer)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
          )),
        ),
      ),
      actions: [
        TextButton(
          onPressed: onSave,
          child: const Text(
            "Save",
            style: TextStyle(),
          ),
        ),
        TextButton(
          onPressed: onCancel,
          child: Text(
            "Cancel",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
          ),
        ),
      ],
    );
  }
}
