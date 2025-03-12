// Import necessary packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/views/splashScreenView.dart';

// App entry point
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// Root widget of the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Graduate +', // App title
      debugShowCheckedModeBanner: false, // Removes debug banner
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: darkBlue), // App theme color
        useMaterial3: true, // Enables Material 3 design
      ),
      home: SplashScreenView(), // Initial screen
    );
  }
}
