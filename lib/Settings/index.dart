import 'package:bai_tap_lon_cuoi_ki/Settings/profile.dart';
import 'package:bai_tap_lon_cuoi_ki/Settings/languague.dart';
import 'package:bai_tap_lon_cuoi_ki/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SettingsIndexPage extends StatelessWidget {
  final Locale currentLocale;
  final ValueChanged<Locale> onLocaleChanged;

  const SettingsIndexPage({
    super.key,
    required this.currentLocale,
    required this.onLocaleChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'imgs/icon.png',
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 30),
            Text(
              l10n.setting,
              style: const TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => TrangProfile(),
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
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.person_outline,
                  size: 32,
                  color: Colors.orange,
                ),
                title: Text(
                  l10n.viewProfile,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => LanguaguesPage(
                    currentLocale: currentLocale,
                    onLocaleChanged:
                        onLocaleChanged,
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
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.language_outlined,
                  size: 32,
                  color: Colors.orange,
                ),
                title: Text(
                  l10n.settinglag,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
