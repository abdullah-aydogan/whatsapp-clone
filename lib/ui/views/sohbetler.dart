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
      appBar: AppBar(
        title: const Text("WhatsApp"),
        backgroundColor: primaryColor,
        foregroundColor: textColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {

            },
          ),
          const SizedBox(width: 6),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {

            },
          ),
          const SizedBox(width: 6),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {

            },
          ),
        ],
      ),
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