import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/sources/local/shared_preference/shared_preference.dart';

final initialLangCodeProvider = Provider<String>((ref) => 'en');

final localeProvider = NotifierProvider<LocaleNotifier, Locale>(() {
  return LocaleNotifier();
});

class LocaleNotifier extends Notifier<Locale> {
  @override
  Locale build() {
    return Locale(ref.watch(initialLangCodeProvider));
  }

  Future<void> toggleLocale() async {
    final newLang = state.languageCode == 'en' ? 'bn' : 'en';
    await SharedPreferenceData.setLanguage(newLang);
    state = Locale(newLang);
  }
}
