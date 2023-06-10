import 'package:flutter/foundation.dart';

class ChoicesProvider extends ChangeNotifier {
  static List<ChoicesProvider> _instances = [];

  ChoicesProvider() {
    _instances.add(this);
  }

  Map<String, List<String>> enteredChoicesMap = {};

  void updateChoices(String fieldId, List<String> choices) {
    enteredChoicesMap[fieldId] = choices;
    notifyListeners();
  }
  void clearCache() {
    enteredChoicesMap.clear();
    notifyListeners();
  }
  void clearAllInstances() {
    for (var instance in _instances) {
      instance.clearCache();
    }
    _instances.clear();
  }
}
