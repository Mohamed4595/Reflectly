import 'package:flutter/material.dart';
import 'package:reflectly/data/Apis/QuotesApis.dart';
import 'package:reflectly/data/models/DailyQuotesModel.dart';

class DailyQuotesProvider extends ChangeNotifier {
  List<DailyQuotesModel> dailyQuotesList = [];
  int currentIndex = 0;

  getDailyQuotes() {
    dailyQuotesList = getQuotesApi();
    notifyListeners();
  }

  setCurrentIndex(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      notifyListeners();
    }
  }
}
