// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World';

  @override
  String get setting => 'Settings';

  @override
  String get account => 'Account';

  @override
  String get appTitle => 'Weather';

  @override
  String get languageTitle => 'Language';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageVietnamese => 'Vietnamese';

  @override
  String get searchCityHint => 'Search city...';

  @override
  String currentCityCount(int count) {
    return 'Current cities: $count';
  }

  @override
  String get home => 'Home';

  @override
  String get viewProfile => 'View Profile';

  @override
  String get settinglag => 'Language';

  @override
  String detailTitle(String city) {
    return 'Details $city';
  }

  @override
  String todayWithDate(String date) {
    return 'Today, $date';
  }

  @override
  String get hourlyForecast => 'Hourly forecast';

  @override
  String get sevenDayForecast => '7-day forecast';

  @override
  String get developersTitle => 'Development team';

  @override
  String studentIdLabel(String id) {
    return 'Student ID: $id';
  }

  @override
  String get weatherSunny => 'Sunny';

  @override
  String get weatherCloudy => 'Cloudy';

  @override
  String get weatherStormWarning => 'Rainy, thunderstorm warning';
}
