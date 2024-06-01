import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier {
  String _selectedLanguage = 'English';

  String get selectedLanguage => _selectedLanguage;

  void changeLanguage(String newLanguage) {
    _selectedLanguage = newLanguage;
    notifyListeners();
  }
}