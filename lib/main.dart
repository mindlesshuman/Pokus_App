import 'package:flutter/material.dart';
import 'package:pokus/core/theme/global_theme.dart';
import 'package:pokus/presentation/screens/main_navigation_hub.dart';

void main() {
  runApp(const PokusApp());
}

/// Root widget of the Pokus application.
///
/// Applies the light [ThemeData] from [GlobalTheme.light] as the default,
/// with dark theme available via [GlobalTheme.dark] for screens that
/// explicitly request the dark variant.
class PokusApp extends StatelessWidget {
  const PokusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokus',
      debugShowCheckedModeBanner: false,

      theme: GlobalTheme.light(),
      darkTheme: GlobalTheme.dark(),
      themeMode: ThemeMode.light, // default; dark forced on specific screens

      home: const MainNavigationHub(),
    );
  }
}
