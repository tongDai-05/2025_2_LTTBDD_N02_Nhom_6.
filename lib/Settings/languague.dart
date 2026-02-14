import 'package:bai_tap_lon_cuoi_ki/Home/home.dart';
import 'package:bai_tap_lon_cuoi_ki/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('vi');

  void _setLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      localizationsDelegates:
          AppLocalizations.localizationsDelegates,
      supportedLocales:
          AppLocalizations.supportedLocales,
      home: ManHinhChinh(
        locale: _locale,
        onLocaleChanged: _setLocale,
      ),
    );
  }
}

class LanguaguesPage extends StatelessWidget {
  final Locale currentLocale;
  final ValueChanged<Locale> onLocaleChanged;

  const LanguaguesPage({
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
        title: Text(l10n.languageTitle),
      ),
      body: Column(
        children: [
          // ListTile(
          //   title: Text(l10n.languageTitle),
          // ),
          ListTile(
            title: Text(l10n.languageVietnamese),
            trailing:
                currentLocale.languageCode == 'vi'
                ? const Icon(Icons.check)
                : null,
            onTap: () {
              onLocaleChanged(const Locale('vi'));
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(l10n.languageEnglish),
            trailing:
                currentLocale.languageCode == 'en'
                ? const Icon(Icons.check)
                : null,
            onTap: () {
              onLocaleChanged(const Locale('en'));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
