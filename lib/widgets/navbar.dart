import 'package:flutter/material.dart';
class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0; // Track the currently selected index

  // Function to handle index changes
  void _onItemTapped(int index) {
    // Hanya ubah state jika indeks yang dipilih berbeda dari indeks aktif
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      switch (index) {
        case 0: // Home
        // Periksa apakah sudah berada di halaman Home
          if (ModalRoute.of(context)?.settings.name != '/home') {
            // Navigator.pushNamed(context, '/home');
          }
          break;
        case 1: // Search
        // Periksa apakah sudah berada di halaman Search
          if (ModalRoute.of(context)?.settings.name != '/home') {
            Navigator.pushNamed(context, '/home');
          }
          break;
        case 2: // Camera
        // Periksa apakah sudah berada di halaman Camera
          if (ModalRoute.of(context)?.settings.name != '/camera') {
            // Navigator.pushNamed(context, '/camera');
          }
          break;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Hindari perubahan ukuran
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,

        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.track_changes,
            ),
            activeIcon: Icon(
              Icons.track_changes,
            ),
            label: 'home',

          ),


          BottomNavigationBarItem(
              icon: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.home,
                  ),
                ),
              ),
              label: 'camera'


          ),


          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,

              ),
              activeIcon: Icon(
                Icons.account_circle,
              ),
              label: 'Profile'


          ),


        ]);
  }
}
