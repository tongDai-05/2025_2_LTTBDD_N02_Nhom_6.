import 'package:bai_tap_lon_cuoi_ki/Settings/profile.dart';
import 'package:bai_tap_lon_cuoi_ki/Settings/setting.dart';
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

  ButtonStyle _buttonStyle(BuildContext context) {
    final colorScheme = Theme.of(
      context,
    ).colorScheme;
    return ElevatedButton.styleFrom(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      minimumSize: const Size.fromHeight(52),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.setting,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              style: _buttonStyle(context),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        TrangProfile(),
                  ),
                );
              },
              icon: const Icon(
                Icons.person_outline,
              ),
              label: Text(
                AppLocalizations.of(
                  context,
                )!.viewProfile,
              ),
            ),

            const SizedBox(height: 12),
            ElevatedButton.icon(
              style: _buttonStyle(context),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => SettingsPage(
                      currentLocale:
                          currentLocale,
                      onLocaleChanged:
                          onLocaleChanged,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.settings_outlined,
              ),
              label: Text(
                AppLocalizations.of(
                  context,
                )!.settinglag,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
