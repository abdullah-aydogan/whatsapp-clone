import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/data/entity/durumlar.dart';
import '../../data/entity/kisiler.dart';

class Guncellemeler extends StatefulWidget {
  
  const Guncellemeler({super.key});

  @override
  State<Guncellemeler> createState() => _GuncellemelerState();
}

class _GuncellemelerState extends State<Guncellemeler> {

  Future<List<Durumlar>> durumlariYukle() async {

    var durumlarListesi = <Durumlar>[];

    var kisi1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_resim: "profile_default.png");
    var kisi2 = Kisiler(kisi_id: 2, kisi_ad: "Mehmet", kisi_resim: "profile_1.png");
    var kisi3 = Kisiler(kisi_id: 3, kisi_ad: "Zeynep", kisi_resim: "profile_2.png");
    var kisi4 = Kisiler(kisi_id: 4, kisi_ad: "Abdullah", kisi_resim: "profile_default.png");

    var d1 = Durumlar(durum_id: 1, durum_resim: "durum_1.png", durum_tarih: "Bugün", kisi: kisi1);
    var d2 = Durumlar(durum_id: 2, durum_resim: "durum_2.png", durum_tarih: "Bugün", kisi: kisi2);
    var d3 = Durumlar(durum_id: 3, durum_resim: "durum_3.png", durum_tarih: "Dün", kisi: kisi3);
    var d4 = Durumlar(durum_id: 4, durum_resim: "durum_4.png", durum_tarih: "Dün", kisi: kisi4);

    durumlarListesi.add(d1);
    durumlarListesi.add(d2);
    durumlarListesi.add(d3);
    durumlarListesi.add(d4);

    return durumlarListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Durumlar>>(
        future: durumlariYukle(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            var durumlarListesi = snapshot.data;

            return ListView.builder(
              itemCount: durumlarListesi!.length,
              itemBuilder: (context, index) {
                var durum = durumlarListesi[index];

                return Padding(
                  padding: const EdgeInsets.only(top: 14.0, bottom: 14.0, left: 18.0),
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("${durum.kisi.kisi_ad} kişisinin durumuna tıklandı.")
                          )
                      );
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: const BorderRadius.all(Radius.circular(50)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("resimler/${durum.durum_resim}"),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(durum.kisi.kisi_ad,
                                style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                  ),
                              ),
                              const SizedBox(height: 6),
                              Text(durum.durum_tarih, style: const TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          else {
            return const Center();
          }
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          foregroundColor: textColor,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Durum paylaşın.")
                )
            );
          },
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}