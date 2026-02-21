// -------------------------------------------------------
// Main Entry Point – Kuttikanam Tourism App
// -------------------------------------------------------
// Sets up MaterialApp with a soft green and beige theme
// and launches the HomeScreen.
// -------------------------------------------------------

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const KuttikanamTourismApp());
}

class KuttikanamTourismApp extends StatelessWidget {
  const KuttikanamTourismApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuttikanam Tourism',
      debugShowCheckedModeBanner: false,
      // -------------------------------------------------------
      // Theme – soft green and beige palette
      // -------------------------------------------------------
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF6B9F6B),
        scaffoldBackgroundColor: const Color(0xFFF9F6F0),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6B9F6B),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
