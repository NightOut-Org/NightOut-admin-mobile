import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nightoutadmin/app.dart';
import 'package:nightoutadmin/config.dart';
import 'package:nightoutadmin/models/app/theme.mode.dart';
import 'package:nightoutadmin/providers/main.provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final themeMode = NightOutThemeMode.fromStorage(prefs.getString(Config.themeStorageKey));

  runApp(
    ProviderScope(
      overrides: [
        initialThemeModeProvider.overrideWithValue(themeMode),
      ],
      child: const App(),
    ),
  );
}
