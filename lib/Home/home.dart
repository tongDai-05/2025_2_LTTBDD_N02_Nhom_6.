import 'package:bai_tap_lon_cuoi_ki/Content/chitietthoitiet.dart';
import 'package:flutter/material.dart';
import 'package:bai_tap_lon_cuoi_ki/Settings/Selection_languague.dart';
import 'package:bai_tap_lon_cuoi_ki/Settings/profile.dart';
import 'package:bai_tap_lon_cuoi_ki/languages/app_localizations.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

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
        // actions: [
        // IconButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) =>
        //             SettingsPage(
        //               currentLocale:
        //                   widget.locale,
        //               onLocaleChanged: widget
        //                   .onLocaleChanged,
        //             ),
        //       ),
        //     );
        //   },
        //   icon: Icon(
        //     Icons.settings,
        //     color: Colors.white,
        //   ),
        // ),
        // IconButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) =>
        //             TrangProfile(),
        //       ),
        //     );
        //   },
        //   icon: Icon(
        //     Icons.person,
        //     color: Colors.white,
        //   ),
        // ),
        // ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
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
          Text(l10n.currentCityCount(ds.length)),
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
        ],
      ),
    );
  }
}
