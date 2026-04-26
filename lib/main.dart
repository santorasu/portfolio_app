import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/resource/theme_manager.dart';
import 'core/route/route_import_part.dart';
import 'core/route/route_name.dart';
import 'data/sources/local/shared_preference/shared_preference.dart';
import 'l10n/app_localizations.dart';

import 'presentation/viewmodel/language_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initialLang = await SharedPreferenceData.getLanguage() ?? 'en';

  runApp(ProviderScope(
    overrides: [
      initialLangCodeProvider.overrideWithValue(initialLang),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        title: 'Portfolio App',
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        onGenerateRoute: AppRouter.getRoute,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('bn')],
        locale: locale,
        initialRoute: RouteName.splashRoute,
      ),
    );
  }
}
