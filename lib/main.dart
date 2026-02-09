import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: ManHinhChinh(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class ManHinhChinh extends StatefulWidget {
  @override
  State<ManHinhChinh> createState() => _ManHinhChinhState();
}

class _ManHinhChinhState extends State<ManHinhChinh> {
  List<String> ds = ['Hà Nội', 'TP.HCM', 'Đà Nẵng'];
  List<String> dsnhietdo = ['32°C', '35°C', '30°C'];
  List<IconData> dsicon = [
    Icons.wb_sunny,
    Icons.wb_sunny,
    Icons.cloud,
  ];

  String keyword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dự báo Thời tiết',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.blue[700],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ds.length,
              itemBuilder: (context, index) {
                if (!ds[index]
                    .toLowerCase()
                    .contains(keyword.toLowerCase())) {
                  return const SizedBox();
                }

                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), 
                  ),
                  child: ListTile(
                    leading: Icon(
                      dsicon[index],
                      size: 32,
                      color: Colors.orange,
                    ),
                    title: Text(
                      ds[index],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      dsnhietdo[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Tìm thành phố...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  keyword = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
