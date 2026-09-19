import 'package:flutter/material.dart';
import '../../core/theme.dart';

class KeuanganScreen extends StatelessWidget {
  const KeuanganScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catatan Keuangan')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBalanceCard(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                children: [
                  _buildStatCard('Pemasukan', 'Rp 12.5M', Colors.green),
                  _buildStatCard('Pengeluaran', 'Rp 4.2M', Colors.red),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Transaksi Terakhir', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            _buildTransactionList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Catat Transaksi', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.add),
                          label: const Text('Pemasukan'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.remove),
                          label: const Text('Pengeluaran'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
        label: const Text('Catat Transaksi'),
        icon: const Icon(Icons.add_circle_outline),
        backgroundColor: AppTheme.primaryGreen,
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Card(
      color: AppTheme.primaryGreen,
      child: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text('Total Keuntungan', style: TextStyle(color: Colors.white70)),
            SizedBox(height: 8),
            Text('Rp 8.300.000', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Modal', style: TextStyle(color: Colors.white70, fontSize: 12)),
                    Text('Rp 5.0M', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
                VerticalDivider(color: Colors.white24),
                Column(
                  children: [
                    Text('ROI', style: TextStyle(color: Colors.white70, fontSize: 12)),
                    Text('166%', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 4),
              Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        final titles = ['Jual Padi', 'Beli Pupuk NPK', 'Sewa Traktor', 'Jual Jagung'];
        final amounts = ['+ Rp 8.000.000', '- Rp 1.500.000', '- Rp 500.000', '+ Rp 4.500.000'];
        final isIncome = amounts[index].startsWith('+');
        
        return ListTile(
          leading: Icon(isIncome ? Icons.arrow_downward : Icons.arrow_upward, color: isIncome ? Colors.green : Colors.red),
          title: Text(titles[index]),
          subtitle: const Text('14 Sep 2026'),
          trailing: Text(amounts[index], style: TextStyle(fontWeight: FontWeight.bold, color: isIncome ? Colors.green : Colors.red)),
        );
      },
    );
  }
}
