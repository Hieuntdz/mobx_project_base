import 'package:mobx/mobx.dart';
import 'package:mobxprojectteamplate/repository/repository.dart';
import 'package:mobxprojectteamplate/theme/themes.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  Repository _repository;

  //Language
  @observable
  String language = 'en';

  @action
  void setLang(String lang) {
    this.language = lang;
  }

  //Theme
  BaseTheme appTheme = LightTheme();
  @observable
  bool useDarkMode = true;

  @action
  setDarkTheme() {
    appTheme = DarkTheme();
    useDarkMode = false;
    _repository.setDarkMode(true);
  }

  @action
  setLightTheme() {
    appTheme = LightTheme();
    useDarkMode = true;
    _repository.setDarkMode(false);
  }

  _AppStore(Repository repository) {
    this._repository = repository;
    bool mode = _repository.getIsDarkMode();
    if (mode) {
      setDarkTheme();
    } else {
      setLightTheme();
    }
  }
}
