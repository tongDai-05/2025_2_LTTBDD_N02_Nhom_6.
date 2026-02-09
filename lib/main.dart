import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ManHinhChinh(), debugShowCheckedModeBanner: false));
}

class ManHinhChinh extends StatefulWidget {
  @override
  State<ManHinhChinh> createState() => _ManHinhChinhState();
}

class _ManHinhChinhState extends State<ManHinhChinh> {
  List ds = ['Hà Nội', 'TP.HCM', 'Đà Nẵng'];
  List dsnhietdo = ['32°C', '20°C', '24°C'];
  List dsicon = [Icons.wb_sunny, Icons.thunderstorm, Icons.cloud];
  List dsMoTa = ['Có nắng', 'Có mưa, Cảnh báo sấm sét', 'Nhiều mây'];

  String keyword = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Row(
          children: [
            Image.asset('imgs/icon.jpg', width: 30, height: 30),
            const SizedBox(width: 10),
            const Text(
              'Dự báo Thời tiết',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ds.length,
              itemBuilder: (context, index) {
                if (!ds[index].toLowerCase().contains(keyword.toLowerCase())) {
                  return const SizedBox();
                }
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChiTietThoiTiet(
                          tenTP: ds[index],
                          nhietDo: dsnhietdo[index],
                          moTa: dsMoTa[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
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
                  ),
                );
              },
            ),
          ),
          Text("Số thành phố hiện tại: ${ds.length}"),
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

class ChiTietThoiTiet extends StatelessWidget {
  final String tenTP;
  final String nhietDo;
  final String moTa;

  const ChiTietThoiTiet({
    super.key,
    required this.tenTP,
    required this.nhietDo,
    required this.moTa,
  });
  String getImageByWeather() {
    if (moTa == 'Nhiều mây') {
      return 'imgs/nhieumay.jpg';
    } else if (moTa == 'Có mưa, Cảnh báo sấm sét') {
      return 'imgs/mua.jpg';
    } else{
      return 'imgs/nang.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết $tenTP"),
        backgroundColor: Colors.blue[700],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tenTP,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.asset(
              getImageByWeather(),
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),

            Text(
              nhietDo,
              style: const TextStyle(fontSize: 26, color: Colors.red),
            ),
            const SizedBox(height: 10),

            Text(
              moTa,
              style: const TextStyle(fontSize: 22, color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
