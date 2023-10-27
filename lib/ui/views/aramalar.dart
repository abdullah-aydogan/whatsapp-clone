import 'package:flutter/material.dart';

import '../../colors.dart';

class Aramalar extends StatefulWidget {

  const Aramalar({super.key});

  @override
  State<Aramalar> createState() => _AramalarState();
}

class _AramalarState extends State<Aramalar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          foregroundColor: textColor,
          onPressed: () {

          },
          child: const Icon(Icons.add_call),
        ),
      ),
    );
  }
}