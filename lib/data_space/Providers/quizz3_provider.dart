import 'package:flutter/foundation.dart';

class ChoicesProvider extends ChangeNotifier {
  Map<String, List<String>> enteredChoicesMap = {};

  void updateChoices(String fieldId, List<String> choices) {
    enteredChoicesMap[fieldId] = choices;
    notifyListeners();
  }
}
