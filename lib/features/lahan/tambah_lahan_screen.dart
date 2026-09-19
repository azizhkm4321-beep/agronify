import 'package:flutter/material.dart';

class TambahLahanScreen extends StatelessWidget {
  const TambahLahanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Lahan')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nama Lahan',
                hintText: 'Contoh: Sawah Utara',
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Luas Lahan (m²)',
                suffixText: 'm²',
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Jenis Tanaman'),
              items: ['Padi', 'Jagung', 'Cabai', 'Bawang Merah']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Lokasi',
                suffixIcon: Icon(Icons.location_on),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Simpan Lahan'),
            ),
          ],
        ),
      ),
    );
  }
}
