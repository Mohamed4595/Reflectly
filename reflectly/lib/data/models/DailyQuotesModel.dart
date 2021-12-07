import 'package:reflectly/data/models/QuotModel.dart';

class DailyQuotesModel {
  String fullDate;
  String fullDayName;
  String dayNumber;
  String shortDayName;
  QuotModel quot;

  DailyQuotesModel(
      {required this.fullDate,
      required this.dayNumber,
      required this.fullDayName,
      required this.shortDayName,
      required this.quot});
}
