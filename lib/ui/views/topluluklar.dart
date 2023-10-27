import 'package:flutter/material.dart';

class Topluluklar extends StatefulWidget {

  const Topluluklar({super.key});

  @override
  State<Topluluklar> createState() => _TopluluklarState();
}

class _TopluluklarState extends State<Topluluklar> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Topluluklar Ekranı", style: TextStyle(fontSize: 30)),
    );
  }
}