import 'package:flutter/material.dart';
import 'package:solemate/widgets/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("SOLMATE"),
            Text("Halo Hamdani"),
            Text("Mau cuci, semer, atau perbaiki sepatu dulu nih?"),
            Container(
              width: double.infinity,
              height: 30,
              child: Text("Cari apa nih?"),
            ),
            Text("Edukasi"),
            Text("Belajar dulu gak sih pentingnya jagain sepatu?"),
            Container(
              width: 100,
              height: 80,
            ),
            Text("Layanan Utama")
          ],
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
