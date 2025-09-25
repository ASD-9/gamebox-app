import 'package:flutter/widgets.dart';

class ActivationProvider extends ChangeNotifier {
  List<int> activedSwitch = [];

  void disableSwitch() {
    activedSwitch = [];
    notifyListeners();
  }

  void toggleSwitch(List<int> indexes) {
    for (var index in indexes) {
      if (activedSwitch.contains(index)) {
        activedSwitch.remove(index);
      } else {
        activedSwitch.add(index);
      }
    }
    notifyListeners();
  }
}
