import 'package:flutter/material.dart';
import 'models/profile.dart';
import 'screens/login_page.dart';
import 'screens/profile_page.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatefulWidget {
  const ProfileApp({super.key});

  @override
  State<ProfileApp> createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
  ThemeMode _themeMode = ThemeMode.light;
  bool _isLoggedIn = false;
  Profile _profile = Profile.initial();

  void _changeTheme(bool isDark) {
    setState(() => _themeMode = isDark ? ThemeMode.dark : ThemeMode.light);
  }

  ThemeData _buildTheme(Brightness brightness) {
    const brown = Color(0xFF795548);
    const cream = Color(0xFFF7F1E8);
    final isLight = brightness == Brightness.light;
    final scheme = ColorScheme.fromSeed(
      seedColor: brown,
      brightness: brightness,
      surface: isLight ? Colors.white : const Color(0xFF211B18),
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: isLight ? cream : const Color(0xFF171310),
      appBarTheme: AppBarTheme(
        backgroundColor: isLight ? cream : const Color(0xFF211B18),
        foregroundColor: isLight ? const Color(0xFF3E2723) : Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: isLight ? Colors.white : const Color(0xFF2B2420),
        elevation: isLight ? 1 : 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isLight ? Colors.white : const Color(0xFF2B2420),
      ),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: scheme.primaryContainer,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: brown,
        foregroundColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
    );
  }
}
