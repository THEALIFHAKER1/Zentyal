// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HeaderBar extends StatefulWidget {
  const HeaderBar({super.key});

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            margin: const EdgeInsets.only(right: 20.00, bottom: 20, top: 20),
            alignment: Alignment.topLeft,
            child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: const Text(
                    'Life',
                    style:
                        TextStyle(fontSize: 50.00, fontWeight: FontWeight.bold),
                  ),
                ))),
        Container(
          margin: const EdgeInsets.only(right: 10.00),
          child: Image.asset(
            color: Theme.of(context).colorScheme.primaryContainer,
            "assets/logo.png",
            height: 100,
            width: 100,
          ),
        )
      ],
    );
  }
}
