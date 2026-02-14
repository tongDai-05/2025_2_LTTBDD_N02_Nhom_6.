import 'package:bai_tap_lon_cuoi_ki/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TrangProfile()));
}

class TrangProfile extends StatelessWidget {
  TrangProfile({super.key});
  List avt = ['imgs/avt1.jpg', 'imgs/avt2.jpg'];
  List ten = ['Tống Sỹ Đại', 'Nguyễn Tiến Dũng'];
  List msv = ['23010037', '23010086'];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          l10n.developersTitle,
          // style: TextStyle(color: Colors.white),
          // nếu cần chữ màu khác thì mới dùng style còn nếu đồng màu thì chỉ cần dùng foregroundColor
        ),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue[700],
      ),
      body: ListView.builder(
        itemCount: ten.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(
                  avt[index],
                ),
              ),
              title: Text(
                ten[index],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                l10n.studentIdLabel(msv[index]),
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
