import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Detail Wisata',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: const DetailScreen(),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar utama di atas
            Stack(
              children: [
                Image.asset(
                  'assets/ranca_upas.jpg', // ganti dengan nama file gambar kamu
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),

            // Nama tempat
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'RANCA UPAS',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),

            // Informasi jam dan harga
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.green),
                      SizedBox(height: 4),
                      Text('OPEN EVERYDAY',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.access_time, color: Colors.green),
                      SizedBox(height: 4),
                      Text('09:00 - 20:00',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.attach_money, color: Colors.green),
                      SizedBox(height: 4),
                      Text('RP 20.000',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Deskripsi
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Ranca Upas Ciwidey adalah kawasan bumi perkemahan di bawah pengelolaan perhutani. '
                'Tempat ini berada di kawasan wisata Bandung Selatan, satu lokasi dengan kawah putih, '
                'kolam Cimanggu dan situ Patenggang. Banyak hal yang bisa dilakukan di kawasan wisata ini, '
                'seperti berkemah, berinteraksi dengan rusa, sampai bermain di water park dan mandi air panas.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.deepPurple,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Gambar tambahan di bawah
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/tenda.jpg', // ganti dengan nama file kamu
                      width: 150,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/danau.jpg', // ganti dengan nama file kamu
                      width: 150,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
