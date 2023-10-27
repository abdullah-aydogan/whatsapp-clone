import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';

class Sohbetler extends StatefulWidget {

  const Sohbetler({super.key});

  @override
  State<Sohbetler> createState() => _SohbetlerState();
}

class _SohbetlerState extends State<Sohbetler> {
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
          child: const Icon(Icons.message_rounded),
        ),
      ),
    );
  }
}