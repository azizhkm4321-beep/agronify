import 'package:flutter/material.dart';

class TambahJadwalScreen extends StatelessWidget {
  const TambahJadwalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Jadwal')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Pilih Lahan'),
              items: ['Lahan Utara', 'Lahan Selatan', 'Sawah Barat']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Jenis Aktivitas'),
              items: ['Penyiraman', 'Pemupukan', 'Penyemprotan', 'Penyiangan']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Tanggal',
                suffixIcon: Icon(Icons.calendar_month),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Waktu',
                suffixIcon: Icon(Icons.access_time),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Catatan (Opsional)',
                hintText: 'Misal: Gunakan pupuk Urea 5kg',
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Simpan Jadwal'),
            ),
          ],
        ),
      ),
    );
  }
}
