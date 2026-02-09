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
  List ds = ['Hà Nội', 'TP.HCM', 'Đà Nẵng'];
  List dsnhietdo = ['32°C', '35°C', '30°C'];
  List dsicon = [
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

                return ListTile(
                  leading: Icon(dsicon[index]),
                  title: Text(ds[index]),
                  subtitle: Text(dsnhietdo[index]),
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
