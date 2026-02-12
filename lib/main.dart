import 'package:flutter/material.dart';
import 'package:bai_tap_lon_cuoi_ki/l10n/app_localizations.dart';
import 'package:intl/intl.dart';

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

class SettingsPage extends StatelessWidget {
  final Locale currentLocale;
  final ValueChanged<Locale> onLocaleChanged;

  const SettingsPage({
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
        title: Text(l10n.setting),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(l10n.languageTitle),
          ),
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

enum WeatherType { sunny, stormWarning, cloudy }

class ManHinhChinh extends StatefulWidget {
  final Locale locale;
  final ValueChanged<Locale> onLocaleChanged;

  const ManHinhChinh({
    super.key,
    required this.locale,
    required this.onLocaleChanged,
  });

  @override
  State<ManHinhChinh> createState() =>
      _ManHinhChinhState();
}

class _ManHinhChinhState
    extends State<ManHinhChinh> {
  List ds = ['Hà Nội', 'TP.HCM', 'Đà Nẵng'];
  List dsnhietdo = ['32°C', '20°C', '24°C'];
  List dsicon = [
    Icons.wb_sunny,
    Icons.thunderstorm,
    Icons.cloud,
  ];
  List<WeatherType> dsWeather = [
    WeatherType.sunny,
    WeatherType.stormWarning,
    WeatherType.cloudy,
  ];

  String keyword = "";
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Row(
          children: [
            Image.asset(
              'imgs/icon.png',
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 30),
            Text(
              l10n.appTitle,
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SettingsPage(
                        currentLocale:
                            widget.locale,
                        onLocaleChanged: widget
                            .onLocaleChanged,
                      ),
                ),
              );
            },
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      TrangProfile(),
                ),
              );
            },
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ds.length,
              itemBuilder: (context, index) {
                if (!ds[index]
                    .toLowerCase()
                    .contains(
                      keyword.toLowerCase(),
                    )) {
                  return const SizedBox();
                }
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChiTietThoiTiet(
                              tenTP: ds[index],
                              nhietDo:
                                  dsnhietdo[index],
                              weatherType:
                                  dsWeather[index],
                            ),
                      ),
                    );
                  },
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                            20,
                          ),
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
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        dsnhietdo[index],
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Text(l10n.currentCityCount(ds.length)),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              12,
              12,
              12,
              30,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: l10n.searchCityHint,
                prefixIcon: const Icon(
                  Icons.search,
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12),
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
  String tenTP;
  String nhietDo;
  WeatherType weatherType;

  ChiTietThoiTiet({
    super.key,
    required this.tenTP,
    required this.nhietDo,
    required this.weatherType,
  });

  String getImageByWeather() {
    switch (weatherType) {
      case WeatherType.cloudy:
        return 'imgs/nhieumay.jpg';
      case WeatherType.stormWarning:
        return 'imgs/mua.jpg';
      case WeatherType.sunny:
        return 'imgs/nang.jpg';
    }
  }

  String getWeatherText(AppLocalizations l10n) {
    switch (weatherType) {
      case WeatherType.sunny:
        return l10n.weatherSunny;
      case WeatherType.stormWarning:
        return l10n.weatherStormWarning;
      case WeatherType.cloudy:
        return l10n.weatherCloudy;
    }
  }

  List gio = [
    '0h',
    '3h',
    '6h',
    '9h',
    '12h',
    '15h',
    '18h',
    '21h',
    '24h',
  ];

  List nhietDoTheoGio = [
    '24°C',
    '23°C',
    '25°C',
    '28°C',
    '32°C',
    '33°C',
    '30°C',
    '27°C',
    '25°C',
  ];
  List iconTheoGio = [
    Icons.nights_stay,
    Icons.nights_stay,
    Icons.wb_sunny,
    Icons.wb_sunny,
    Icons.wb_sunny,
    Icons.wb_sunny,
    Icons.cloud,
    Icons.cloud,
    Icons.nights_stay,
  ];
  List ngay7 = [
    'Thứ 2',
    'Thứ 3',
    'Thứ 4',
    'Thứ 5',
    'Thứ 6',
    'Thứ 7',
    'CN',
  ];
  List nhietDo7Ngay = [
    '32°C',
    '31°C',
    '30°C',
    '29°C',
    '33°C',
    '34°C',
    '32°C',
  ];
  List icon7Ngay = [
    Icons.wb_sunny,
    Icons.cloud,
    Icons.cloud,
    Icons.wb_sunny,
    Icons.thunderstorm,
    Icons.wb_sunny,
    Icons.wb_sunny,
  ];
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeName = Localizations.localeOf(
      context,
    ).toString();
    final todayFormatted = DateFormat.yMd(
      localeName,
    ).format(DateTime.now());
    final days7 = List.generate(
      7,
      (index) => DateFormat.E(localeName).format(
        DateTime.now().add(Duration(days: index)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(l10n.detailTitle(tenTP)),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              tenTP,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Image.asset(
                getImageByWeather(),
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              l10n.todayWithDate(todayFormatted),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              nhietDo,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26,
                color: Colors.red,
              ),
            ),
            Text(
              getWeatherText(l10n),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              l10n.hourlyForecast,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 140,
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection:
                      Axis.horizontal,
                  itemCount: gio.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 90,
                      margin:
                          const EdgeInsets.symmetric(
                            horizontal: 6,
                          ),
                      padding:
                          const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius:
                            BorderRadius.circular(
                              18,
                            ),
                      ),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .center,
                        children: [
                          Text(
                            gio[index],
                            textAlign:
                                TextAlign.center,
                            style:
                                const TextStyle(
                                  fontSize: 14,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Icon(
                            iconTheoGio[index],
                            color: Colors.orange,
                            size: 32,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            nhietDoTheoGio[index],
                            textAlign:
                                TextAlign.center,
                            style:
                                const TextStyle(
                                  fontSize: 14,
                                ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              l10n.sevenDayForecast,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),
              itemCount: ngay7.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(14),
                  ),
                  child: ListTile(
                    leading: Icon(
                      icon7Ngay[index],
                      color: Colors.orange,
                      size: 30,
                    ),
                    title: Text(
                      days7[index],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      nhietDo7Ngay[index],
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
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
