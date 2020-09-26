import 'package:mobxprojectteamplate/repository/local.dart';
import 'package:mobxprojectteamplate/utils/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  static final Repository _repository = Repository._internal();

  factory Repository(SharedPreferences preferences) {
    LocalStorage localStorage = LocalStorage(preferences);
    _repository._localStorage = localStorage;
    return _repository;
  }

  Repository._internal();

  LocalStorage _localStorage;

  void setDarkMode(bool value) {
    _localStorage.setDarkMode(value);
  }

  bool getIsDarkMode() {
    return _localStorage.getIsDarkMode(AppPresKey.useDarkMode);
  }
}
