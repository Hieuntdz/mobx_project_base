import 'package:flutter/cupertino.dart';
import 'package:mobxprojectteamplate/utils/logger.dart';

import 'locale_base.dart';

class LocDelegate extends LocalizationsDelegate<LocaleBase> {
  const LocDelegate();

  final idMap = const {'en': 'assets/lang/en.json', 'vi': 'assets/lang/vi.json'};

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<LocaleBase> load(Locale locale) async {
    var lang = 'en';
    if (isSupported(locale)) {
      Logger.info("LocDelegate isSupported ${locale.countryCode} ______ ${locale.languageCode}");
      lang = locale.languageCode;
    } else {
      Logger.info("LocDelegate UNSupported $locale");
    }
    final loc = LocaleBase();
    await loc.load(idMap[lang]);
    return loc;
  }

  @override
  bool shouldReload(LocDelegate old) => false;
}
