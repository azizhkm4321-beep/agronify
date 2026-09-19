import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'features/auth/splash_screen.dart';
import 'features/home/beranda_screen.dart';
import 'features/lahan/lahan_list_screen.dart';
import 'features/jadwal/jadwal_screen.dart';
import 'features/pasar/pasar_screen.dart';
import 'features/profil/profil_screen.dart';

void main() {
  runApp(const TaniCerdasApp());'';
}

class TaniCerdasApp extends StatelessWidget {
  const TaniCerdasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaniCerdas',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const BerandaScreen(),
    const LahanListScreen(),
    const JadwalScreen(),
    const PasarScreen(),
    const ProfilScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primaryGreen,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.landscape), label: 'Lahan'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Jadwal'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Pasar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

