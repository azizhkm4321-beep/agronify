import 'package:flutter/material.dart';
import '../../core/theme.dart';

class LahanDetailScreen extends StatelessWidget {
  final String name;
  const LahanDetailScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard(),
            const SizedBox(height: 24),
            Text('Tahap Pertumbuhan', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            _buildGrowthProgress(),
            const SizedBox(height: 24),
            Text('Riwayat Aktivitas', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            _buildHistoryList(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Komoditas', style: TextStyle(color: Colors.grey)),
                Text('Padi Ciherang', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tanggal Tanam', style: TextStyle(color: Colors.grey)),
                Text('12 Agustus 2026', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Estimasi Panen', style: TextStyle(color: Colors.grey)),
                Text('15 November 2026', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryGreen)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrowthProgress() {
    return Column(
      children: [
        LinearProgressIndicator(
          value: 0.6,
          backgroundColor: Colors.grey.shade200,
          color: AppTheme.primaryGreen,
          minHeight: 12,
          borderRadius: BorderRadius.circular(6),
        ),
        const SizedBox(height: 8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Vegetatif'),
            Text('Generatif'),
            Text('Panen'),
          ],
        ),
      ],
    );
  }

  Widget _buildHistoryList() {
    return Column(
      children: [
        _buildHistoryItem('Pemupukan NPK', '3 hari yang lalu', Icons.science),
        _buildHistoryItem('Penyemprotan Hama', '1 minggu yang lalu', Icons.bug_report),
        _buildHistoryItem('Penyiangan Gulma', '2 minggu yang lalu', Icons.grass),
      ],
    );
  }

  Widget _buildHistoryItem(String title, String date, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.earthBrown),
      title: Text(title),
      subtitle: Text(date),
    );
  }
}
