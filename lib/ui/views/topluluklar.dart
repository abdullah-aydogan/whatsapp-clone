import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';

class Topluluklar extends StatefulWidget {

  const Topluluklar({super.key});

  @override
  State<Topluluklar> createState() => _TopluluklarState();
}

class _TopluluklarState extends State<Topluluklar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/topluluk_resim.png"),
            const Text("Topluluklar sayesinde bağlantıda kalın", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text("Topluluklar, üyelerin konulara göre ayrılmış gruplarda bir araya gelmelerini sağlar ve yönetici duyurularını almalarını kolaylaştırır. Eklendiğiniz tüm topluluklar burada gösterilir.",
              textAlign: TextAlign.center),
            Text("Örnek topluluklara bakın ﹥", style: TextStyle(color: primaryColor)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: textColor,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Topluluk oluşturuldu. :)")
                    )
                );
              },
              child: const Text("Topluluğunuzu oluşturun"),
            ),
          ],
        )
      ),
    );
  }
}