import 'package:flutter/material.dart';

void main() {
  runApp(const AishhaApp());
}

class AishhaApp extends StatelessWidget {
  const AishhaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'عيشها ببساطة',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("عيشها ببساطة")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _buildCard(context, "المهام", Icons.check_circle, Colors.green),
            _buildCard(context, "الملاحظات", Icons.note_alt, Colors.blue),
            _buildCard(context, "المصاريف", Icons.attach_money, Colors.orange),
            _buildCard(context, "المزاج", Icons.mood, Colors.purple),
            _buildCard(context, "التعلم", Icons.school, Colors.teal),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("صفحة $title قريبًا")));
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 12),
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}