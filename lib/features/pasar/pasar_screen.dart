import 'package:flutter/material.dart';
import '../../core/theme.dart';

class PasarScreen extends StatelessWidget {
  const PasarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Harga Pasar')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari komoditas...',
                prefixIcon: const Icon(Icons.search),
                fillColor: Colors.grey.shade200,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                final names = ['Padi Ciherang', 'Cabai Merah', 'Bawang Merah', 'Jagung Pipil', 'Kedelai'];
                final prices = ['Rp 7.500 /kg', 'Rp 45.000 /kg', 'Rp 32.000 /kg', 'Rp 5.200 /kg', 'Rp 12.000 /kg'];
                final trends = [true, false, true, true, false];
                
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppTheme.primaryGreen.withOpacity(0.1),
                    child: const Icon(Icons.shopping_bag, color: AppTheme.primaryGreen),
                  ),
                  title: Text(names[index], style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(prices[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        trends[index] ? Icons.trending_up : Icons.trending_down,
                        color: trends[index] ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        trends[index] ? '+2%' : '-5%',
                        style: TextStyle(color: trends[index] ? Colors.green : Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
