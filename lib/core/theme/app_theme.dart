import 'package:flutter/material.dart';

const List<Color> _colorThemes = <Color>[
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
      : assert(selectedTheme >= 0 && selectedTheme < _colorThemes.length,
            'selectedTheme must be between 0 and ${_colorThemes.length - 1}'),
        _selectedTheme = selectedTheme;

  ThemeData get themeData => ThemeData(
        colorSchemeSeed: _colorThemes[_selectedTheme],
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light,
      );
}
