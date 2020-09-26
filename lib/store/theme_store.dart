import 'package:mobx/mobx.dart';
import 'package:mobxprojectteamplate/repository/repository.dart';
import 'package:mobxprojectteamplate/theme/themes.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  Repository _repository;

  @observable
  bool useDarkMode = true;

  BaseTheme appTheme = LightTheme();

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

  _ThemeStore(Repository repository) {
    this._repository = repository;
    bool mode = _repository.getIsDarkMode();
    if (mode) {
      setDarkTheme();
    } else {
      setLightTheme();
    }
  }
}
