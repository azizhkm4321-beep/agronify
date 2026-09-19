import 'package:flutter/material.dart';
import '../../core/theme.dart';
import 'tambah_jadwal_screen.dart';

class JadwalScreen extends StatefulWidget {
  const JadwalScreen({super.key});

  @override
  State<JadwalScreen> createState() => _JadwalScreenState();
}

class _JadwalScreenState extends State<JadwalScreen> {
  final List<Map<String, dynamic>> _tasks = [
    {'title': 'Penyiraman Lahan A', 'time': '07:00 WIB', 'done': true},
    {'title': 'Pemupukan NPK Lahan B', 'time': '08:30 WIB', 'done': false},
    {'title': 'Cek Hama Lahan C', 'time': '16:00 WIB', 'done': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jadwal Aktivitas')),
      body: Column(
        children: [
          _buildCalendarStrip(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return Card(
                  child: CheckboxListTile(
                    value: task['done'],
                    onChanged: (val) => setState(() => task['done'] = val),
                    title: Text(task['title'],
                        style: TextStyle(
                          decoration: task['done'] ? TextDecoration.lineThrough : null,
                          color: task['done'] ? Colors.grey : Colors.black,
                        )),
                    subtitle: Text(task['time']),
                    activeColor: AppTheme.primaryGreen,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TambahJadwalScreen())),
        backgroundColor: AppTheme.primaryGreen,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add_task),
      ),
    );
  }

  Widget _buildCalendarStrip() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(7, (index) {
            final day = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'][index];
            final date = 14 + index;
            final isSelected = index == 0;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppTheme.primaryGreen : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(day, style: TextStyle(color: isSelected ? Colors.white : Colors.grey)),
                  Text('$date', style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold)),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
