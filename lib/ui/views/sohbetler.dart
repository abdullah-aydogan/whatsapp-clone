import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/data/entity/kisiler.dart';
import '../../data/entity/mesajlar.dart';

class Sohbetler extends StatefulWidget {

  const Sohbetler({super.key});

  @override
  State<Sohbetler> createState() => _SohbetlerState();
}

class _SohbetlerState extends State<Sohbetler> {

  Future<List<Mesajlar>> mesajlariYukle() async {

    var mesajlarListesi = <Mesajlar>[];

    var kisi1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_resim: "profile_default.png");
    var kisi2 = Kisiler(kisi_id: 2, kisi_ad: "Mehmet", kisi_resim: "profile_1.png");
    var kisi3 = Kisiler(kisi_id: 3, kisi_ad: "Zeynep", kisi_resim: "profile_2.png");
    var kisi4 = Kisiler(kisi_id: 4, kisi_ad: "Abdullah", kisi_resim: "profile_default.png");

    var m1 = Mesajlar(mesaj_id: 1, mesaj_tarih: "Bugün", son_mesaj: "Selam", kisi: kisi1);
    var m2 = Mesajlar(mesaj_id: 2, mesaj_tarih: "Dün", son_mesaj: "Görüşmek üzere.", kisi: kisi2);
    var m3 = Mesajlar(mesaj_id: 3, mesaj_tarih: "24.10.2023", son_mesaj: "Fotoğrafları gönderdim.", kisi: kisi3);
    var m4 = Mesajlar(mesaj_id: 4, mesaj_tarih: "23.10.2023", son_mesaj: "Proje güzelmiş.", kisi: kisi4);

    mesajlarListesi.add(m1);
    mesajlarListesi.add(m2);
    mesajlarListesi.add(m3);
    mesajlarListesi.add(m4);

    return mesajlarListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Mesajlar>>(
        future: mesajlariYukle(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            var mesajlarListesi = snapshot.data;

            return ListView.builder(
              itemCount: mesajlarListesi!.length,
              itemBuilder: (context, index) {
                var mesaj = mesajlarListesi[index];

                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 14.0, left: 12.0, right: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("${mesaj.kisi.kisi_ad} tıklandı.")
                          )
                      );
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Image.asset("resimler/${mesaj.kisi.kisi_resim}"),
                          const SizedBox(width: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(mesaj.kisi.kisi_ad,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                  ),
                              ),
                              const SizedBox(height: 6),
                              Text(mesaj.son_mesaj),
                            ],
                          ),
                          const Spacer(),
                          Text(mesaj.mesaj_tarih, style: const TextStyle(fontSize: 12)),
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
                    content: Text("Kişilerinize mesaj yazın.")
                )
            );
          },
          child: const Icon(Icons.message_rounded),
        ),
      ),
    );
  }
}