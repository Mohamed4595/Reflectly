import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reflectly/data/Apis/QuotesApis.dart';
import 'package:reflectly/data/models/DailyQuotesModel.dart';

class LogoAnimationProvider extends ChangeNotifier {
  int currentAnimationState = 0;

  //0 open
  //1 short close
  //2 short open

  getCurrentAnimationState() {
    Timer _timer;
    _timer = new Timer(
        Duration(milliseconds: currentAnimationState == 0 ? 6000 : 200), () {
      if (currentAnimationState == 0) {
        currentAnimationState = 1;
      } else if (currentAnimationState == 1) {
        currentAnimationState = 2;
      } else {
        currentAnimationState = 0;
      }
      notifyListeners();
    });
  }
}
