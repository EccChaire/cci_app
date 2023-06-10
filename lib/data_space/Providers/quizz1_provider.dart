import 'package:flutter/foundation.dart';


class TextProvider extends ChangeNotifier {
  static List<TextProvider> _instances = [];

  TextProvider() {
    _instances.add(this);
  }

  Map<String, String> enteredTextMap = {};

  void updateText(String fieldId, String text) {
    enteredTextMap[fieldId] = text;
    notifyListeners();
  }
  void clearCache() {
    enteredTextMap.clear();
    notifyListeners();
  }

  void clearAllInstances() {
    for (var instance in _instances) {
      instance.clearCache();
    }
    _instances.clear();
  }

}
