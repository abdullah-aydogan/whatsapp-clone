import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';

class Guncellemeler extends StatefulWidget {
  
  const Guncellemeler({super.key});

  @override
  State<Guncellemeler> createState() => _GuncellemelerState();
}

class _GuncellemelerState extends State<Guncellemeler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Güncellemeler Ekranı", style: TextStyle(fontSize: 30)),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          foregroundColor: textColor,
          onPressed: () {

          },
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}