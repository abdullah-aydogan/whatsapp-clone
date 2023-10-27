import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/ui/views/aramalar.dart';
import 'package:whatsapp_clone/ui/views/guncellemeler.dart';
import 'package:whatsapp_clone/ui/views/sohbetler.dart';
import 'package:whatsapp_clone/ui/views/topluluklar.dart';

class Anasayfa extends StatefulWidget {

  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
          bottom: TabBar(
            tabs: const [
              Tab(icon: Icon(Icons.groups_rounded)),
              Tab(text: "Sohbet"),
              Tab(text: "Durum"),
              Tab(text: "Arama"),
            ],
            labelColor: textColor,
            indicatorColor: textColor,
            unselectedLabelColor: unSelectedColor,
          ),
        ),
        body: const TabBarView(
          children: [
            Topluluklar(),
            Sohbetler(),
            Guncellemeler(),
            Aramalar(),
          ],
        ),
      ),
    );
  }
}