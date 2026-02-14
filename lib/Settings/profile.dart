import 'package:bai_tap_lon_cuoi_ki/languages/app_localizations.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TrangProfile(),
  ));
}
class TrangProfile extends StatelessWidget {
  TrangProfile({super.key});
  List avt = ['imgs/avt1.jpg', 'imgs/avt2.jpg'];
  List ten = ['Tống Sỹ Đại', 'Nguyễn Tiến Dũng'];
  List msv = ['23010037', '23010086'];
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(l10n?.developersTitle ?? "Developers"),
        titleTextStyle: const TextStyle(
          fontSize: 24,
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
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FullScreenImage(
                        imagePath: avt[index],
                      ),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(avt[index]),
                ),
              ),
              title: Text(
                ten[index],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                l10n?.studentIdLabel(msv[index]) ??
                    "MSV: ${msv[index]}",
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
class FullScreenImage extends StatelessWidget {
  final String imagePath;
  const FullScreenImage({super.key, required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: InteractiveViewer(
            minScale: 0.5,
            maxScale: 4,
            child: Image.asset(imagePath),
          ),
        ),
      ),
    );
  }
}
