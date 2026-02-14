import 'package:bai_tap_lon_cuoi_ki/Home/home.dart';
import 'package:bai_tap_lon_cuoi_ki/Settings/index.dart';
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
      home: MainScreen(
        locale: _locale,
        onLocaleChanged: _setLocale,
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  final Locale locale;
  final ValueChanged<Locale> onLocaleChanged;

  const MainScreen({
    super.key,
    required this.locale,
    required this.onLocaleChanged,
  });

  @override
  _MainScreenState createState() =>
      _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      ManHinhChinh(
        locale: widget.locale,
        onLocaleChanged: widget.onLocaleChanged,
      ),
      SettingsIndexPage(
        currentLocale: widget.locale,
        onLocaleChanged: widget.onLocaleChanged,
      ),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: AppLocalizations.of(
              context,
            )!.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: AppLocalizations.of(
              context,
            )!.setting,
          ),
        ],
      ),
    );
  }
}
