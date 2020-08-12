import 'package:burc_rehberi/models/burc.dart';
import 'package:burc_rehberi/utils/strings.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BurcListesi extends StatelessWidget {
  List<Burc> tumBurclar;
  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynaginiHazirla();
    return Scaffold(
      appBar: AppBar(
        title: Text("Burç Rehberi"),
      ),
      body: listeyiHazirla(),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> burclar = [];
    for (var i = 0; i < 12; i++) {
      String kucukResim = Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      String buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk${i + 1}.png";

      Burc eklenecekBurc = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          kucukResim,
          buyukResim);
      burclar.add(eklenecekBurc);
    }
    return burclar;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (context, index) => tekSatirBurcWidget(context, index),
      itemCount: tumBurclar.length,
    );
  }

  Widget tekSatirBurcWidget(context, index) {
    Burc listeyeEklenenBurclar = tumBurclar[index];
    return Card(
      elevation: 4,
      child: ListTile(
        leading: Image.asset(
          "images/" + listeyeEklenenBurclar.burcKucukResim,
          width: 64,
          height: 64,
        ),
        title: Text(
          listeyeEklenenBurclar.burcAdi,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Colors.pink.shade500,
          ),
        ),
        subtitle: Text(
          listeyeEklenenBurclar.burcTarihi,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.pink,
        ),
      ),
    );
  }
}
