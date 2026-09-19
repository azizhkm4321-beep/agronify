import 'package:flutter/material.dart';
import '../../core/theme.dart';
import 'lahan_detail_screen.dart';
import 'tambah_lahan_screen.dart';

class LahanListScreen extends StatelessWidget {
  const LahanListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Lahan')),
      body: ListView.builder(
        itemCount: 3,
        padding: const EdgeInsets.only(top: 8, bottom: 80),
        itemBuilder: (context, index) {
          final names = ['Lahan Utara', 'Lahan Selatan', 'Sawah Barat'];
          final crops = ['Padi', 'Jagung', 'Cabai'];
          final sizes = ['500 m²', '1200 m²', '300 m²'];
          
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LahanDetailScreen(name: names[index]))),
              title: Text(names[index], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text('Tanaman: ${crops[index]}'),
                  Text('Luas: ${sizes[index]}'),
                ],
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.secondaryGreen.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Subur', style: TextStyle(color: AppTheme.primaryGreen, fontWeight: FontWeight.bold)),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TambahLahanScreen())),
        label: const Text('Tambah Lahan'),
        icon: const Icon(Icons.add),
        backgroundColor: AppTheme.primaryGreen,
        foregroundColor: Colors.white,
      ),
    );
  }
}
