import 'package:flutter/material.dart';
import '../../core/theme.dart';

class PanduanScreen extends StatelessWidget {
  const PanduanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> guides = [
      {
        'title': 'Cara Membasmi Wereng Cokelat',
        'content': 'Wereng cokelat adalah salah satu hama yang paling ditakuti petani padi. Untuk membasminya, pertama-tama pastikan sistem irigasi berjalan baik (pengairan berselang).\n\nPenggunaan pestisida harus tepat dosis dan waktu. Sebaiknya penyemprotan dilakukan pada pagi hari saat embun masih ada atau sore hari. Gunakan varietas padi yang tahan wereng seperti Inpari untuk pencegahan jangka panjang.',
        'tag': 'Hama'
      },
      {
        'title': 'Teknik Pemupukan Berimbang Padi',
        'content': 'Pemupukan berimbang adalah memberikan pupuk sesuai dengan kebutuhan tanaman dan tingkat kesuburan tanah. Gunakan kombinasi Urea, SP-36, dan KCl.\n\nWaktu pemupukan yang ideal adalah saat tanaman berumur 7-10 HST (Hari Setelah Tanam), 21-25 HST, dan saat primordia bunga sekitar 35-40 HST. Pastikan tanah dalam kondisi lembab saat memupuk agar nutrisi terserap sempurna.',
        'tag': 'Nutrisi'
      },
      {
        'title': 'Memilih Benih Jagung Unggul',
        'content': 'Benih unggul adalah kunci awal kesuksesan panen. Ciri benih baik adalah ukurannya seragam, bernas, dan tidak cacat atau berjamur.\n\nPastikan benih memiliki sertifikat resmi dan masa kadaluarsa yang masih lama. Benih hibrida biasanya memberikan hasil yang lebih tinggi namun membutuhkan perawatan yang lebih intensif dibandingkan benih lokal.',
        'tag': 'Benih'
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Panduan Tani')),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: guides.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppTheme.primaryGreen.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.menu_book, color: AppTheme.primaryGreen),
              ),
              title: Text(guides[index]['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(guides[index]['tag']! + ' • 5 menit baca'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PanduanDetailScreen(
                      title: guides[index]['title']!,
                      content: guides[index]['content']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PanduanDetailScreen extends StatelessWidget {
  final String title;
  final String content;

  const PanduanDetailScreen({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Panduan')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.primaryGreen)),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Text(content, style: const TextStyle(fontSize: 16, height: 1.6, color: Colors.black87)),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: const Row(
                children: [
                  Icon(Icons.lightbulb_outline, color: Colors.orange),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Tips: Tanyakan pada penyuluh pertanian setempat untuk informasi lebih detail sesuai kondisi lahan Anda.',
                      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
