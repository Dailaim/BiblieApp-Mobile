import 'package:flutter/material.dart';

const List<Color> colorThemes = <Color>[
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.teal,
  Colors.pink,
  Colors.amber,
  Colors.indigo,
];

class AppTheme {
  final int _selectedTheme;

  final bool isDark;

  const AppTheme({int selectedTheme = 0, this.isDark = false})
      : assert(selectedTheme >= 0 && selectedTheme < colorThemes.length,
            'selectedTheme must be between 0 and ${colorThemes.length - 1}'),
        _selectedTheme = selectedTheme;

  ThemeData get themeData => ThemeData(
        colorSchemeSeed: colorThemes[_selectedTheme],
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light,
      );
}
