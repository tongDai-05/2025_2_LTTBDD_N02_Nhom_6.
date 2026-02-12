// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get helloWorld => 'Xin chào';

  @override
  String get setting => 'Cài đặt';

  @override
  String get account => 'Tài khoản';

  @override
  String get appTitle => 'Dự báo thời tiết';

  @override
  String get languageTitle => 'Ngôn ngữ';

  @override
  String get languageEnglish => 'Tiếng Anh';

  @override
  String get languageVietnamese => 'Tiếng Việt';

  @override
  String get searchCityHint => 'Tìm thành phố...';

  @override
  String currentCityCount(int count) {
    return 'Số thành phố hiện tại: $count';
  }

  @override
  String detailTitle(String city) {
    return 'Chi tiết $city';
  }

  @override
  String todayWithDate(String date) {
    return 'Hôm nay, $date';
  }

  @override
  String get hourlyForecast => 'Dự báo theo giờ';

  @override
  String get sevenDayForecast => 'Dự báo 7 ngày';

  @override
  String get developersTitle => 'Thành viên phát triển';

  @override
  String studentIdLabel(String id) {
    return 'MSV: $id';
  }

  @override
  String get weatherSunny => 'Có nắng';

  @override
  String get weatherCloudy => 'Nhiều mây';

  @override
  String get weatherStormWarning => 'Có mưa, Cảnh báo sấm sét';
}
