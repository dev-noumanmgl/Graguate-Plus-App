// Import necessary packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart'; // Custom color utilities
import 'package:graduate_plus/utilities/commonButton.dart'; // Reusable button widget
import 'package:graduate_plus/utilities/customTextField.dart'; // Custom text field widget
import 'package:graduate_plus/views/homePageScreenView.dart'; // Home page view

// SignInScreenView widget (StatelessWidget as no internal state is needed)
class SignInScreenView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // Key to validate the form

  @override
  Widget build(BuildContext context) {
    final double screenWidth =
        MediaQuery.of(context).size.width; // Get screen width

    // Controllers to handle input from text fields
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent app bar
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon:
              Icon(CupertinoIcons.back, color: blackColor), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        titleSpacing: 0, // Remove default title spacing
        title: Row(
          children: [
            // Logo in the app bar
            Image.asset(
              'assets/images/bcuLogo.png',
              height: 40.0, // Logo height
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Screen padding
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                140, // Adjust container height
            child: Form(
              key: _formKey, // Assign the form key for validation
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Center items horizontally
                children: [
                  // Sign In title text
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 24.0, // Font size
                      fontWeight: FontWeight.bold, // Bold text
                      color: Colors.black, // Text color
                    ),
                  ),
                  SizedBox(height: 40.0), // Spacing below the title

                  // Email input field
                  CustomTextField(
                    controller: emailController, // Controller for email input
                    hintText: 'Enter your email', // Placeholder text
                    prefixIcon: Icons.mail_outline, // Mail icon
                    validator: (value) {
                      // Validate email input
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email'; // Email format validation
                      }
                      return null; // Input is valid
                    },
                  ),
                  SizedBox(height: 20.0), // Spacing between fields

                  // Password input field
                  CustomTextField(
                    controller:
                        passwordController, // Controller for password input
                    hintText: 'Enter your password', // Placeholder text
                    prefixIcon: Icons.lock_outline, // Lock icon
                    obscureText: true, // Hide password input
                    validator: (value) {
                      // Validate password input
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null; // Input is valid
                    },
                  ),

                  // Forgot password link
                  Align(
                    alignment: Alignment.centerRight, // Align text to the right
                    child: TextButton(
                      onPressed: () {
                        // Placeholder for forgot password functionality
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                            color: Colors.blue, fontSize: 14.0), // Link style
                      ),
                    ),
                  ),
                  Expanded(
                      child:
                          SizedBox()), // Pushes content up, leaving space at the bottom

                  // Sign In button
                  GestureDetector(
                    onTap: () {
                      // Navigate to the home page when tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomePageScreenView(), // Navigate to home page
                        ),
                      );
                    },
                    child: commonButton(
                      context: context,
                      label: "Sign In", // Button label
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
