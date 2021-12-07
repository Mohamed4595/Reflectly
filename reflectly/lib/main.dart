import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:reflectly/screens/dailyQuotes/DailyQuotes.dart';
import 'package:reflectly/screens/dashboard/Dashboard.dart';
import 'package:reflectly/utils/AppScrollBehavior.dart';
import 'package:reflectly/utils/MyLanguages.dart';
import 'package:reflectly/utils/MyTheme.dart';
import 'package:reflectly/utils/ScreenConfig.dart';

import 'utils/size_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: AppScrollBehavior(),
      home: Dashboard(),
      unknownRoute: getDailyQuotesConfig.page,
      theme: MyTheme.lightTheme,
      getPages: [],
      translations: CustomTranslation(),
      locale: Locale("en"),
      fallbackLocale: Locale("en"),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
