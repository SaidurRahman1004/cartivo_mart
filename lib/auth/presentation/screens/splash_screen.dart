import 'package:cartivo_mart/app/extensions/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/providers/language_provider.dart';
import '../../../app/providers/theme_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset('assets/images/logoApp.png', height: 120),
          Text(
            context.l10.welcome,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(context.l10.selectLanguage),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: Text(context.l10.selectLanguage),
                    trailing: DropdownButton<Locale>(
                      value: languageProvider.currentLocale,
                      underline: const SizedBox(),
                      items: const [
                        DropdownMenuItem(
                          value: Locale('en'),
                          child: Text('English'),
                        ),
                        DropdownMenuItem(
                          value: Locale('bn'),
                          child: Text('বাংলা'),
                        ),
                      ],
                      onChanged: (locale) =>
                          languageProvider.changeLanguage(locale!),
                    ),
                  ),
                  const Divider(),
                  SwitchListTile(
                    secondary: Icon(
                      themeProvider.themeMode == ThemeMode.dark
                          ? Icons.dark_mode
                          : Icons.light_mode,
                    ),
                    title: Text("Dark Mode"),
                    value: themeProvider.themeMode == ThemeMode.dark,
                    onChanged: (value) => themeProvider.toggleTheme(value),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        context.l10.next,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
