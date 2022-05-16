import 'dart:async';

import 'package:app_test/app/app_screen.dart';
import 'package:app_test/vars/locales.dart';
import 'package:app_test/vars/model_notifier/photo_notifier/photo_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

bool startActive = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive.registerAdapter(ModelUserAdapter());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Hive.initFlutter();

  try {
    await Hive.openBox<String>('configs');
    await Hive.openBox('data');
  } catch (_) {}

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<LocaleManager>(create: (_) => LocaleManager()),
    ChangeNotifierProvider<PhotoNotifier>(create: (_) => PhotoNotifier()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return MaterialApp(
        builder: (context, child) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: ScrollConfiguration(behavior: _ScrollBehaviour(), child: child!)),
          );
        },
        locale: c.watch<LocaleManager>().locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ru')],
        // title: 'Psychology',
        debugShowCheckedModeBanner: false,
        home: const MyStart());
  }
}

class MyStart extends HookWidget {
  const MyStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    print(111);

    final future = useMemoized(() {});
    return FutureBuilder<String>(
        future: future,
        builder: (c, snapshot) {
          if (!startActive) load(c);
          startActive = true;
          return const AppScreen();
        });
  }

  Future load(BuildContext c) async {}
}

class _ScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
