// Import necessary packages
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'dart:async'; // For using Timer
import 'package:graduate_plus/views/welcomeScreenView.dart';

// Splash screen widget with state management
class SplashScreenView extends StatefulWidget {
  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController; // Controls the animation
  late Animation<double> _scaleAnimation; // Defines scaling animation

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller with a 2-second duration
    _animationController = AnimationController(
      vsync: this, // Provides a ticker for animation
      duration: Duration(seconds: 2),
    );

    // Define the scale animation with an easeInOut curve
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward(); // Start the scaling animation

    // Navigate to WelcomeScreenView after a 3-second delay
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomeScreenView()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose controller to free resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with dark blue color
          Container(color: darkBlue),

          // Centered animated logo inside a circular container
          Center(
            child: ScaleTransition(
              scale: _scaleAnimation, // Applies the scale animation
              child: Container(
                width:
                    MediaQuery.of(context).size.width * 0.4, // Responsive width
                height: MediaQuery.of(context).size.width *
                    0.4, // Responsive height
                decoration: BoxDecoration(
                  color: Colors.white, // Circle background color
                  shape: BoxShape.circle, // Circular shape
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/bcuLogo1.png', // Logo image
                    height: MediaQuery.of(context).size.height *
                        0.15, // Responsive image height
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
