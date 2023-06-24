import 'package:flutter/foundation.dart';

class ValueProvider extends ChangeNotifier {
  static List<ValueProvider> _instances = [];

  ValueProvider() {
    _instances.add(this);
  }

  Map<String, double> enteredValueMap = {};

  void updateValue(String fieldId, double value) {
    enteredValueMap[fieldId] = value;
    notifyListeners();

  }
  void clearCache() {
    enteredValueMap.clear();
    notifyListeners();
  }
  void clearAllInstances() {
    for (var instance in _instances) {
      instance.clearCache();
    }
    _instances.clear();
  }
  int getCount() {
    return _instances.length;
  }
}
