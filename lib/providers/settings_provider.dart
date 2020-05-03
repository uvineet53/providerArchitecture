import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  String _units;
  List<String> _waxLines;
  SettingsProvider() {
    _units = "Imperial";
    _waxLines = ['Swix', 'Toco'];
    loadPreferences();
  }
  //getters
  String get units => _units;
  List<String> get waxLines => _waxLines;

  //setters
  void setUnits(String units) {
    _units = units;
    notifyListeners();
    savedPreference();
  }

  void _setWaxes(List<String> waxLines) {
    _waxLines = waxLines;
    notifyListeners();
  }

  void addWaxLines(String waxLine) {
    if (_waxLines.contains(waxLine) == false) {
      _waxLines.add(waxLine);
      notifyListeners();
      savedPreference();
    }
  }

  void removeWaxLines(String waxLine) {
    if (_waxLines.contains(waxLine) == true) {
      _waxLines.remove(waxLine);
      notifyListeners();
      savedPreference();
    }
  }

  savedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('units', _units);
    prefs.setStringList('waxLines', _waxLines);
  }

  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String units = prefs.getString('units');
    List<String> waxLines = prefs.getStringList('waxLines');

    if (units != null) {
      setUnits(units);
    }
    if (waxLines != null) {
      _setWaxes(waxLines);
    }
  }
}
