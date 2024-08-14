import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final rm = <String, String>{};

  MainApp({super.key}) {
    rm['namaResto'] = 'Rumah Makan Sedap Rasa';
    rm['emailResto'] = 'rmsedaprasa@gmail.com';
    rm['noResto'] = '0821-8696-4055';
    rm['gbrResto'] = 'rmsedaprasa.png';
    rm['alamat'] = 'Jl. Irawan No. 38, Kelurahan Pendrikan Kidul, Semarang';
    rm['desc'] =
        '''Nikmati kelezatan autentik masakan Padang di tempat kami, Rumah Makan Sedap Rasa! Dengan hidangan khas seperti rendang yang empuk, ayam pop yang gurih, dan sambal hijau yang pedas menggugah selera, setiap suapan adalah perjalanan rasa yang tak terlupakan. Dapatkan pengalaman kuliner yang memanjakan lidah dalam suasana hangat dan ramah. Datang dan rasakan kelezatan asli dari "Rasa Nusantara" – tempat di mana setiap hidangan bercerita tentang tradisi dan cinta untuk masakan Padang!''';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rumah Makan Sedap Rasa",
      home: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              teksJudul(rm['namaResto'] ?? ''),
              Image(image: AssetImage('assets/${rm['gbrResto'] ?? ''}')),
              SizedBox(height: 10),
              Row(
                children: [
                  btnContact(Icons.email, Colors.grey[800],
                      "mailto:${rm['emailResto']}"),
                  btnContact(Icons.phone, Colors.lightGreen,
                      "https://wa.me/${rm['noResto']}"),
                  btnContact(
                      Icons.map_rounded, Colors.blue, "tel:${rm['noResto']}")
                ],
              ),
              SizedBox(height: 10),
              teksJudul("Deskripsi :"),
              SizedBox(height: 10),
              teksDesc(rm['desc'] ?? ''),
              SizedBox(height: 10),
              teksJudul("List Menu :"),
              SizedBox(height: 10),
              listMenu('- Rendang'),
              listMenu('- Dendeng Sapi'),
              listMenu('- Usus Sapi'),
              SizedBox(height: 10),
              teksJudul("Alamat :"),
              teksAlamat(rm['alamat'] ?? ''),
              SizedBox(height: 10),
              teksJudul("Jam Buka :"),
              SizedBox(
                height: 10,
              ),
              jamBuka("Senin - Jum'at : ", "09:00 - 21:00"),
              jamBuka("Sabtu - Minggu : ", "10:00 - 22:00"),
            ],
          ),
        ),
      ),
    );
  }

  Container teksJudul(String teks) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      child: Text(
        teks,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
      ),
    );
  }

  Container teksDesc(String teks) {
    return Container(
      child: Text(
        teks,
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }

  Row listMenu(String teks) {
    return Row(
      children: [
        Text(
          teks,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.left,
        )
      ],
    );
  }

  Container teksAlamat(String teks) {
    return Container(
      child: Text(
        teks,
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.left,
      ),
    );
  }

  Row jamBuka(String hari, String jam) {
    return Row(
      children: [
        Text(
          hari,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        Text(
          jam,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          launch(uri);
        },
        child: Icon(icon),
        style: ElevatedButton.styleFrom(
            backgroundColor: color, foregroundColor: Colors.white),
      ),
    );
  }

  void launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil: $uri');
    }
  }
}
