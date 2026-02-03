import 'package:cartivo_mart/app/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'app_routs.dart';
import '../l10n/app_localizations.dart';
import 'app_theme.dart';
class CartivoApp extends StatelessWidget {
  const CartivoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> LanguageProvider()),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context,languageProvider, child) {
          return MaterialApp(
            locale: languageProvider.currentLocale,
            supportedLocales: languageProvider.supportedLocale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            onGenerateRoute: AppRouts.onGenerateRoute,
            theme: AppTheme.darkTheme,
          );
        }
      ),
    );
  }
}
