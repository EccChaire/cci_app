import 'package:flutter/foundation.dart';

class ValueProvider extends ChangeNotifier {
  Map<String, double> enteredValueMap = {};

  void updateValue(String fieldId, double value) {
    enteredValueMap[fieldId] = value;
    notifyListeners();
  }
}
