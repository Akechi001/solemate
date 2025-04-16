import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:solemate/widgets/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("SOLMATE", style: TextStyle(fontSize: 48),),
              const Gap(10),
              Text("Halo User", style: TextStyle(fontSize: 16),),
              Text("Mau cuci, semer, atau perbaiki sepatu dulu nih?", style: TextStyle(fontSize: 14),),
              const Gap(20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Cari apa nih?"),
                ),
              ),
              const Gap(20),
              Text("Edukasi", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text("Belajar dulu gak sih pentingnya jagain sepatu?", style: TextStyle(fontSize: 15),),
              const Gap(5),
              Container(
                width: 300,
                height: 180,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
              ),
              const Gap(20),
              Text("Layanan Utama", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
