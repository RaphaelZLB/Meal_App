import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

var lightThemeColor = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(0, 150, 136, 1.0),
);
var darkThemeColor = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(0, 150, 136, 1.0),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: lightThemeColor,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: TabsScreen(),
    );
  }
}
