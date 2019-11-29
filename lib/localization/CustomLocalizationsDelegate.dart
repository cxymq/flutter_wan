import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan/localization/CustomLocalizations.dart';

class CustomLocalizationsDelegate extends LocalizationsDelegate<CustomLocalizations> {
  @override
  bool isSupported(Locale locale) {
    
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<CustomLocalizations> load(Locale locale) {
    
    return SynchronousFuture<CustomLocalizations>(CustomLocalizations(locale.languageCode == "zh"));
  }

  @override
  bool shouldReload(LocalizationsDelegate<CustomLocalizations> old) {
    
    return false;
  }
}