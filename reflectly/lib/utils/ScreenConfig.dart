import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reflectly/screens/dailyQuotes/DailyQuotes.dart';

_ScreenConfig get getDailyQuotesConfig => _ScreenConfig(
      screenFullPath: "/Daily-Quotes/",
      screenWidget: DailyQuotes(),
    );

class _ScreenConfig {
  final String screenFullPath;
  final Widget screenWidget;
  final String? screenPath;

  _ScreenConfig({
    required this.screenFullPath,
    required this.screenWidget,
    this.screenPath,
  });

  GetPage get page => GetPage(
        name: screenFullPath,
        page: () => screenWidget,
      );
}
