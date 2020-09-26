import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxprojectteamplate/repository/repository.dart';
import 'package:mobxprojectteamplate/store/theme_store.dart';
import 'package:mobxprojectteamplate/theme/themes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        Provider<ThemeStore>(
          create: (_) => ThemeStore(_repository),
        )
      ],
      child: Consumer<ThemeStore>(
        builder: (context, store, _) {
          return Observer(
            builder: (context) => MaterialApp(
                title: 'Flutter Demo',
                localizationsDelegates: [
                  const LocDelegate(),
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
  ThemeStore _themeStore;

  void _changeTheme() {
    _themeStore.useDarkMode ? _themeStore.setDarkTheme() : _themeStore.setLightTheme();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStore = Provider.of<ThemeStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeTheme();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
