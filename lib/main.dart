// Import necessary packages
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/views/splashScreenView.dart';
import 'package:graduate_plus/views/welcomeScreenView.dart';

// App entry point
void main() {
  runApp(const MyApp()); // Launches the application
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
