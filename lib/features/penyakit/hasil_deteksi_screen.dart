import 'package:flutter/material.dart';
import '../../core/theme.dart';

class HasilDeteksiScreen extends StatelessWidget {
  const HasilDeteksiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil Deteksi')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey.shade300,
                child: const Icon(Icons.image, size: 100, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Penyakit Terdeteksi:', style: Theme.of(context).textTheme.bodyLarge),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(color: Colors.red.shade100, borderRadius: BorderRadius.circular(20)),
                  child: const Text('Risiko Tinggi', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const Text('Hawar Daun Bakteri', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red)),
            const SizedBox(height: 16),
            _buildSection('Penyebab', 'Disebabkan oleh bakteri Xanthomonas oryzae yang menyebar melalui air irigasi atau hujan.'),
            _buildSection('Solusi & Penanganan', 
              '1. Gunakan varietas tahan bakteri.\n'
              '2. Kurangi penggunaan pupuk nitrogen berlebih.\n'
              '3. Semprotkan bakterisida berbahan aktif tembaga sesuai dosis.'
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
              child: const Text('Kembali ke Beranda'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          Text(content, style: const TextStyle(height: 1.5)),
        ],
      ),
    );
  }
}
