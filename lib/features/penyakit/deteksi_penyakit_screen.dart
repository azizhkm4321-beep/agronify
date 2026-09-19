import 'package:flutter/material.dart';
import '../../core/theme.dart';
import 'hasil_deteksi_screen.dart';

class DeteksiPenyakitScreen extends StatelessWidget {
  const DeteksiPenyakitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deteksi Penyakit')),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              color: Colors.black87,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt, size: 80, color: Colors.white54),
                  SizedBox(height: 16),
                  Text('Arahkan kamera ke daun yang sakit', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(Icons.photo_library, 'Galeri', () {}),
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HasilDeteksiScreen())),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(color: AppTheme.primaryGreen, shape: BoxShape.circle),
                      child: const Icon(Icons.camera, size: 40, color: Colors.white),
                    ),
                  ),
                  _buildActionButton(Icons.flash_off, 'Flash', () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, VoidCallback onTap) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(icon: Icon(icon, size: 32), onPressed: onTap),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
