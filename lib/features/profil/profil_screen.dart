import 'package:flutter/material.dart';
import '../../core/theme.dart';

import 'package:url_launcher/url_launcher.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

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
        title: const Text('Profil Petani'),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppTheme.secondaryGreen,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text('Pak Budi Santoso', style: Theme.of(context).textTheme.titleLarge),
            const Text('Petani Milenial • Sleman, DIY'),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProfileStat('3', 'Lahan'),
                _buildProfileStat('12', 'Panen'),
                _buildProfileStat('4.8', 'Rating'),
              ],
            ),
            const SizedBox(height: 24),
            _buildMenuTile(Icons.history, 'Riwayat Panen'),
            _buildMenuTile(Icons.account_balance_wallet_outlined, 'Metode Pembayaran'),
            _buildMenuTile(Icons.help_outline, 'Pusat Bantuan', onTap: _launchWhatsApp),
            _buildMenuTile(Icons.logout, 'Keluar', color: Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileStat(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildMenuTile(IconData icon, String title, {Color? color, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: color ?? AppTheme.primaryGreen),
      title: Text(title, style: TextStyle(color: color)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
