import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxprojectteamplate/repository/repository.dart';
import 'package:mobxprojectteamplate/store/app_store.dart';
import 'package:mobxprojectteamplate/theme/themes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'language/locale_base.dart';
import 'language/locate_delegate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  Repository _repository;

  MyApp(this.sharedPreferences) {
    _repository = Repository(this.sharedPreferences);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppStore>(
          create: (_) => AppStore(_repository),
        )
      ],
      child: Consumer<AppStore>(
        builder: (context, store, _) {
          return Observer(
            builder: (context) => MaterialApp(
                title: 'Flutter Demo',
                localizationsDelegates: [
                  new LocDelegate(store.language),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: [Locale("en"), Locale("vi")],
                home: MyHomePage(title: 'Flutter Demo Home Page'),
                theme: store.useDarkMode ? DarkTheme().themData : LightTheme().themData),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AppStore _appStore;
  LocaleBase _language;

  void _changeTheme() {
    _appStore.useDarkMode ? _appStore.setDarkTheme() : _appStore.setLightTheme();
  }

  void _changeLanguageToVi() {
    _appStore.setLang('vi');
  }

  void _changeLanguageToEn() {
    _appStore.setLang('en');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appStore = Provider.of<AppStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    _language = Localizations.of<LocaleBase>(context, LocaleBase);
    return Scaffold(
      appBar: AppBar(
        title: Text(_language.lang.getLanguage),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  _changeTheme();
                },
                child: Text(
                  "ChangeTheme",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  _changeLanguageToVi();
                },
                child: Text(
                  "Change Language to Vietnamese",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  _changeLanguageToEn();
                },
                child: Text(
                  "Change Language to English",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          )),
    );
  }
}
