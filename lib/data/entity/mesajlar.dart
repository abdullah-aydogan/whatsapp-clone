import 'package:whatsapp_clone/data/entity/kisiler.dart';

class Mesajlar {

  int mesaj_id;
  String mesaj_tarih;
  String son_mesaj;
  Kisiler kisi;

  Mesajlar({required this.mesaj_id, required this.mesaj_tarih, required this.son_mesaj, required this.kisi});
}