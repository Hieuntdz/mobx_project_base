import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class LocaleBase {
  Map<String, dynamic> _data;

  Future<void> load(String path) async {
    final strJson = await rootBundle.loadString(path);
    _data = jsonDecode(strJson);
    initAll();
  }

  LocaleMain _lang;

  LocaleMain get lang => _lang;

  void initAll() {
    _lang = LocaleMain(Map<String, String>.from(_data));
  }
}

class LocaleMain {
  final Map<String, String> _data;

  LocaleMain(this._data);

  String get getLanguage => _data["language"];
}
