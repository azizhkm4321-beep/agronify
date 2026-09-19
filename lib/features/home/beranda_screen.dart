import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../cuaca/cuaca_screen.dart';
import '../penyakit/deteksi_penyakit_screen.dart';
import '../keuangan/keuangan_screen.dart';
import '../panduan/panduan_screen.dart';

import 'package:url_launcher/url_launcher.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  Future<void> _launchWhatsApp() async {
    final Uri url = Uri.parse('https://wa.me/6285856213541');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TaniCerdas'),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Halo, Pak Tani!', style: Theme.of(context).textTheme.titleLarge),
                  const Text('Berikut ringkasan lahan Anda hari ini.'),
                ],
              ),
            ),
            _buildWeatherCard(context),
            _buildQuickActions(context),
            _buildLandSummary(context),
            _buildNotificationList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionItem(context, Icons.camera_alt, 'Deteksi', const DeteksiPenyakitScreen()),
          _buildActionItem(context, Icons.account_balance_wallet, 'Keuangan', const KeuanganScreen()),
          _buildActionItem(context, Icons.menu_book, 'Panduan', const PanduanScreen()),
          _buildActionItem(context, Icons.support_agent, 'Bantuan', null, onTap: _launchWhatsApp),
        ],
      ),
    );
  }

  Widget _buildActionItem(BuildContext context, IconData icon, String label, Widget? destination, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap ?? (destination != null ? () => Navigator.push(context, MaterialPageRoute(builder: (context) => destination)) : null),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppTheme.primaryGreen),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildWeatherCard(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CuacaScreen())),
      child: Card(
        color: AppTheme.secondaryGreen,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cuaca Hari Ini', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Cerah Berawan', style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 8),
                  Text('28°C', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                ],
              ),
              const Icon(Icons.wb_cloudy, size: 64, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLandSummary(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ringkasan Lahan', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildSummaryItem(Icons.landscape, '3', 'Total Lahan'),
              _buildSummaryItem(Icons.eco, 'Padi', 'Komoditas Utama'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(IconData icon, String value, String label) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, color: AppTheme.primaryGreen),
              const SizedBox(height: 8),
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tugas Hari Ini', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          _buildTaskItem('Pemupukan Lahan A', '08:00 WIB', Colors.orange),
          _buildTaskItem('Penyiraman Lahan B', '16:00 WIB', Colors.blue),
        ],
      ),
    );
  }

  Widget _buildTaskItem(String title, String time, Color color) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: color, radius: 8),
      title: Text(title),
      subtitle: Text(time),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
