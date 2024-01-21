import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen/home_screen.dart';
import 'models/person.dart';
import 'univ_constants.dart';

import 'dart:async' show Future;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadPerson();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    //TODO: Remove debug Prints
    //TODO: Add acievements
    //TODO: Add experiences
    //TODO: Better Organization of code
    //TODO: Add Expertise
    //TODO: Add Hobbies
    //TODO: Add my thoughts 
    //TODO: Add education

    
    return MaterialApp(
      title: "Akhand's Portfolio",
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        canvasColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white)
            .copyWith(
              bodyLarge: const TextStyle(color: bodyTextColor),
              bodyMedium: const TextStyle(color: bodyTextColor),
            ),
      ),
      home: const SafeArea(child: HomeScreen()),
    );
  }
}
