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

  String get getDoneText => _data["done"];

  String get getMoreText => _data["more"];

  String get getRateText => _data["rate"];

  String get getSaveText => _data["save"];

  String get getShareText => _data["share"];

  String get getPreviewText => _data["preview"];

  String get getLoadingText => _data["loading"];

  String get getErrorOccurredText => _data["error_occurred"];

  String get getSaveSuccessText => _data["save_success"];

  String get getSaveFailedText => _data["Save_failed"];

  String get getTutorialText => _data["tutorial"];

  String get getThemeText => _data["theme"];

  String get getInputMoneyText => _data["input_wanted_money"];

  String get getInputDesText => _data["input_des"];

  String get getInputNameText => _data["input_name"];

  String get getInputValueText => _data["input_value"];

  String get getClickToEditText => _data["click_to_edit"];

  String get getWantedText => _data["wanted_name"];

  String get getCardNameText => _data["card_name"];

  String get getCardDesText => _data["card_des"];

  String get getMoreAppText => _data["more_app"];
}
