// Import necessary packages
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart'; // Custom color utilities
import 'package:graduate_plus/utilities/commonButton.dart'; // Custom button widget
import 'package:graduate_plus/views/signInScreenView.dart'; // Sign-in screen view

// Welcome screen widget (Stateless since no state management is required)
class WelcomeScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgroundPic.png', // Background image
              fit: BoxFit.cover, // Cover the entire screen
            ),
          ),
          // Foreground content with padding
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor, // Container background color
                  borderRadius: BorderRadius.circular(16), // Rounded corners
                ),
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // Shrinks column to fit content
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height /
                            20), // Top spacing
                    // App logo
                    Image.asset(
                      'assets/images/bcuLogo.png', // Logo image
                      height: 100, // Fixed logo height
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height /
                            7), // Spacing below logo
                    // LOGIN button with navigation to SignInScreenView
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SignInScreenView(), // Navigate to sign-in screen
                            ),
                          );
                        },
                        child: commonButton(
                          context: context,
                          label: "LOGIN", // Button label
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Spacing between buttons
                    // I'M A GRADUATE button (functionality not implemented yet)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: commonButton(
                        context: context,
                        label: "I'M A GRADUATE", // Button label
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height /
                            20), // Bottom spacing
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
