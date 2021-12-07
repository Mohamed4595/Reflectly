import 'package:get/get.dart';

enum MyLanguageKeys {
  appName,
}

class CustomTranslation extends Translations {
  Map<String, String> _arStrings = {};
  Map<String, String> _enStrings = {};

  @override
  Map<String, Map<String, String>> get keys {
    _addString(
        key: MyLanguageKeys.appName.toString(),
        enValue: "Reflectly",
        arValue: "");

    return {'en': _enStrings, 'ar': _arStrings};
  }

  _addString({required String key, String? enValue, String? arValue}) {
    if (enValue != null) _enStrings[key] = enValue;
    if (arValue != null) _arStrings[key] = arValue;
  }
}
