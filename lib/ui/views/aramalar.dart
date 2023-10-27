import 'package:flutter/material.dart';
import 'package:whatsapp_clone/data/entity/cagrilar.dart';
import '../../colors.dart';
import '../../data/entity/kisiler.dart';

class Aramalar extends StatefulWidget {

  const Aramalar({super.key});

  @override
  State<Aramalar> createState() => _AramalarState();
}

class _AramalarState extends State<Aramalar> {

  Future<List<Cagrilar>> cagrilariYukle() async {

    var cagrilarListesi = <Cagrilar>[];

    var kisi1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_resim: "profile_default.png");
    var kisi2 = Kisiler(kisi_id: 2, kisi_ad: "Mehmet", kisi_resim: "profile_1.png");

    var c1 = Cagrilar(cagri_id: 1, cagri_tarih: "24.10.2023", kisi: kisi1);
    var c2 = Cagrilar(cagri_id: 2, cagri_tarih: "15.10.2023", kisi: kisi2);

    cagrilarListesi.add(c1);
    cagrilarListesi.add(c2);

    return cagrilarListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Cagrilar>>(
        future: cagrilariYukle(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            var cagrilarListesi = snapshot.data;

            return ListView.builder(
              itemCount: cagrilarListesi!.length,
              itemBuilder: (context, index) {
                var cagri = cagrilarListesi[index];

                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 14.0, left: 12.0, right: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("${cagri.kisi.kisi_ad} tıklandı.")
                          )
                      );
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Image.asset("resimler/${cagri.kisi.kisi_resim}"),
                          const SizedBox(width: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cagri.kisi.kisi_ad,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Icon(Icons.call_made, color: primaryColor),
                                  const SizedBox(width: 4),
                                  Text(cagri.cagri_tarih),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("${cagri.kisi.kisi_ad} aranıyor...")
                                  )
                              );
                            },
                            icon: Icon(Icons.phone, color: primaryColor),
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
                    content: Text("Kişilerinizle iletişime geçin.")
                )
            );
          },
          child: const Icon(Icons.add_call),
        ),
      ),
    );
  }
}