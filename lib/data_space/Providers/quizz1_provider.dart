import 'package:flutter/foundation.dart';

class TextProvider extends ChangeNotifier {
  Map<String, String> enteredTextMap = {};

  void updateText(String fieldId, String text) {
    enteredTextMap[fieldId] = text;
    notifyListeners();
  }

}
