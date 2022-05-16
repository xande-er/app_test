import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LocaleManager extends ChangeNotifier {
  Locale _locale = const Locale('en');

  LocaleManager() {
    if (Hive.box<String>('configs').containsKey('locale')) {
      final locale = Hive.box<String>('configs').get('locale');
      _locale = Locale(locale!);
    } else {
      final locales = WidgetsBinding.instance!.window.locales;

      for (final locale in locales) {
        if (locale.languageCode == 'en' || locale.languageCode == 'sr') {
          _locale = locale;
          break;
        }
      }
    }
  }

  Locale get locale => _locale;

  void setLocale(LocaleList locale) {
    switch (locale) {
      case LocaleList.russian:
        Hive.box<String>('configs').put('locale', 'ru');
        _locale = const Locale('ru');
        break;
    }
    notifyListeners();
  }
}

enum LocaleList { russian }
