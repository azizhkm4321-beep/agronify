import 'package:flutter/material.dart';
import '../../core/theme.dart';

class CuacaScreen extends StatelessWidget {
  const CuacaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Cuaca')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text('Sleman, Yogyakarta', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    Icon(Icons.wb_sunny, size: 80, color: Colors.orange),
                    SizedBox(height: 16),
                    Text('30°C', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                    Text('Cerah', style: TextStyle(fontSize: 18, color: Colors.grey)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildWeatherDetail('Kelembapan', '65%', Icons.water_drop),
                _buildWeatherDetail('Kec. Angin', '12 km/jam', Icons.air),
              ],
            ),
            const SizedBox(height: 16),
            _buildForecastList(),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: const Row(
                children: [
                  Icon(Icons.lightbulb, color: Colors.blue),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Rekomendasi: Waktu yang baik untuk penyemprotan pestisida karena angin tenang.',
                      style: TextStyle(color: Colors.blue),
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

  Widget _buildWeatherDetail(String label, String value, IconData icon) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, color: Colors.blue),
              const SizedBox(height: 8),
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForecastList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text('Prakiraan 5 Hari ke Depan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        for (var i = 1; i <= 5; i++)
          ListTile(
            leading: Text('Besok +$i'),
            title: const Row(
              children: [
                Icon(Icons.wb_cloudy, size: 20, color: Colors.grey),
                SizedBox(width: 8),
                Text('Berawan'),
              ],
            ),
            trailing: const Text('27° / 24°'),
          ),
      ],
    );
  }
}
