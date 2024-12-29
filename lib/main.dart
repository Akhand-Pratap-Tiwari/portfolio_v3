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
    //TODO: Add acievements
    //TODO: Add experiences
    //TODO: Add Expertise
    //TODO: Add my thoughts 
    //TODO: Add Hobbies
    //TODO: Add comments section
    //TODO: Add education
    //TODO: Better Organization of code
    //TODO: Remove debug Prints

    
    return MaterialApp(
      title: "Akhand's Portfolio",
      theme: ThemeData.light(useMaterial3: true).copyWith(
        primaryColor: primaryColor,
        // scaffoldBackgroundColor: bgColor,
        // canvasColor: bgColor,
        // textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
        //     .apply(bodyColor: Colors.white)
        //     .copyWith(
        //       bodyLarge: const TextStyle(color: bodyTextColor),
        //       bodyMedium: const TextStyle(color: bodyTextColor),
        //     ),
      ),
      home: const SafeArea(child: SelectionArea(child: HomeScreen())),
    );
  }
}
//flutter build web --web-renderer canvaskit
