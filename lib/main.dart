import 'package:flutter/material.dart';

void main(){
  runApp(MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Rayhan',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: ProfilSaya(),
    );
  }
}
