import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobxprojectteamplate/utils/logger.dart';

import 'locale_base.dart';

class LocDelegate extends LocalizationsDelegate<LocaleBase> {
  var appLang = 'en';

  LocDelegate(var lang) {
    Logger.info("LocDelegate init language $lang");
    this.appLang = lang;
  }

  final idMap = const {'en': 'assets/lang/en.json', 'vi': 'assets/lang/vi.json'};

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<LocaleBase> load(Locale locale) async {
    //nếu lấy theo ngôn ngữ của device thì dùng thằng này
//    var lang = 'en';
//    if (isSupported(locale)) {
//      Logger.info("LocDelegate isSupported ${locale.countryCode} ______ ${locale.languageCode}");
//      lang = locale.languageCode;
//    } else {
//      Logger.info("LocDelegate UNSupported $locale");
//    }

    // Nếu tự settting chọn ngôn ngữ trong app thì dùng thằng này
    Logger.info("LocDelegate load language $appLang");
    var lang = appLang;

    final loc = LocaleBase();
    await loc.load(idMap[lang]);
    return loc;
  }

  @override
  bool shouldReload(LocDelegate old) => true;
}
