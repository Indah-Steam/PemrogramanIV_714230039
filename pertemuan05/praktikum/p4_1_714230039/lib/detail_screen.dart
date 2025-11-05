import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/tourism_place.dart';
// import 'model/tourism_place.dart'; // Asumsi file ini ada dan berisi data

var iniFontCustom = const TextStyle(fontFamily: 'Staatliches');

class DetailScreen extends StatelessWidget {
  // Kembali menggunakan constructor positional
  final TourismPlace place;

  const DetailScreen(this.place, {super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: <Widget>[
                // Tambahkan AspectRatio dan fit untuk memperbaiki tata letak gambar
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    place.imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),

            // Bagian Informasi (Row)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Hari Buka
                  Column(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.blue),
                      const SizedBox(height: 8.0),
                      Text(
                        place.openDays,
                        style: iniFontCustom,
                      ),
                    ],
                  ),
                  // Jam Operasional
                  Column(
                    children: [
                      const Icon(Icons.access_time, color: Colors.blue),
                      const SizedBox(height: 8.0),
                      Text(
                        place.openTime,
                        style: iniFontCustom,
                      ),
                    ],
                  ),
                  // Harga Tiket
                  Column(
                    children: [
                      const Icon(Icons.monetization_on, color: Colors.blue),
                      const SizedBox(height: 8.0),
                      Text(
                        place.ticketPrice,
                        style: iniFontCustom,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Bagian Deskripsi
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                place.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),

            // Galeri Gambar Horizontal
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      // Tambahkan AspectRatio di sini (sesuai langkah 32 praktikum)
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Image.network(
                          url,
                          fit: BoxFit.cover, // Tambahkan fit
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}