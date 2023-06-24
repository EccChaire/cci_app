import 'package:flutter/foundation.dart';


class ChoicesProvider extends ChangeNotifier {
  static List<ChoicesProvider> _instances = [];

  ChoicesProvider() {
    _instances.add(this);
  }

  Map<String, List<String>> enteredChoicesMap = {};
  int choicesCount = 0; // Counter variable

  void updateChoices(String fieldId, List<String> choices) {
    bool sent = false;
    for (var instance in _instances) {
      if(instance.enteredChoicesMap.containsKey(fieldId)){
        instance.enteredChoicesMap[fieldId] = choices;
        sent = true;
      }
    }
    if (!sent){
      enteredChoicesMap[fieldId] = choices;
      if(choices[0] != '' && choices[1] != '' ){

      }// Increment the counter
    }
    notifyListeners();
  }

  void clearCache() {
    enteredChoicesMap.clear();
    notifyListeners();
  }

  void clearAllInstances() {
    for (var instance in _instances) {
      instance.clearCache();
      choicesCount = 0 ;
    }
    _instances.clear();
    choicesCount = 0 ;
  }

  int getCount() {
    for (var instance in _instances) {
      if(instance.enteredChoicesMap[0] != '' && instance.enteredChoicesMap[1] != '' ){
        choicesCount++;
      }
    }
    return choicesCount;// Return the count of choices
  }
}
