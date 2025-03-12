import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/database/userPrefs.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/utilities/commonButton.dart';
import 'package:graduate_plus/views/homePageScreenView.dart';

class SignInScreenView extends StatefulWidget {
  const SignInScreenView({super.key});

  @override
  State<SignInScreenView> createState() => _SignInScreenViewState();
}

class _SignInScreenViewState extends State<SignInScreenView> {
  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Reference to Firebase Realtime Database
  final DatabaseReference _database = FirebaseDatabase.instance.ref("students");

  // Error messages for form validation
  String? emailError, passwordError;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      if (emailError != null && emailController.text.isNotEmpty) {
        setState(() {
          emailError = null;
        });
      }
    });
    passwordController.addListener(() {
      if (passwordError != null && passwordController.text.isNotEmpty) {
        setState(() {
          passwordError = null;
        });
      }
    });
  }

  // Boolean to manage loading state
  bool isLoading = false;

  /// Function to handle user sign-in
  Future<void> _signIn() async {
    setState(() {
      // Validate email field
      emailError = emailController.text.trim().isEmpty
          ? "Required field"
          : !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(emailController.text.trim())
              ? "Enter a valid email"
              : null;

      // Validate password field
      passwordError = passwordController.text.trim().isEmpty
          ? "Required field"
          : passwordController.text.trim().length < 6
              ? "Password must be at least 6 characters"
              : null;
    });

    // If both fields are valid, proceed with sign-in
    if (emailError == null && passwordError == null) {
      setState(() {
        isLoading = true; // Show loading indicator
      });

      try {
        // Fetch student data from Firebase
        DataSnapshot snapshot = await _database.get();
        if (snapshot.exists) {
          bool userFound = false;
          Map<String, dynamic>? userData;

          // Loop through all student records
          for (var student in snapshot.children) {
            Map<dynamic, dynamic> data = student.value as Map<dynamic, dynamic>;

            // Check if entered email & password match any record
            if (data['email'] == emailController.text.trim() &&
                data['password'] == passwordController.text.trim()) {
              userFound = true;
              userData = Map<String, dynamic>.from(data);
              break;
            }
          }

          // If user is found, navigate to HomeScreen
          if (userFound && userData != null) {
            await UserPrefs.saveUserData(userData);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePageScreenView()),
            );
          } else {
            // Show error message if credentials are incorrect
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Invalid email or password!")),
            );
          }
        } else {
          // Show error message if no users exist in the database
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("No users found in the database!")),
          );
        }
      } catch (e) {
        // Handle any errors that occur during Firebase query
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.toString()}")),
        );
      }

      // Hide loading indicator after operation completes
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: blackColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        titleSpacing: 0,
        title: Row(
          children: [Image.asset('assets/images/bcuLogo.png', height: 40.0)],
        ),
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Sign-in heading
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 40.0),

                        // Email input field
                        buildTextField(
                          emailController,
                          "Email",
                          "Enter email",
                          Icons.email,
                          errorText: emailError,
                          isEmail: true,
                        ),

                        // Password input field
                        buildTextField(
                          passwordController,
                          "Password",
                          "Enter password",
                          Icons.lock,
                          errorText: passwordError,
                          isPassword: true,
                        ),
                      ],
                    ),
                  ),
                ),

                // Sign-in button with loading indicator
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap: _signIn,
                    child: commonButton(
                      context: context,
                      label: "Sign In",
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(
                0.5,
              ), // Semi-transparent background
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white, // White spinner
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// Widget to build custom text input fields
  Widget buildTextField(
    TextEditingController controller,
    String label,
    String hint,
    IconData icon, {
    bool isEmail = false,
    bool isPassword = false,
    String? errorText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
            borderSide: BorderSide(color: Colors.grey), // Border color
          ),
          errorText: errorText, // Display error message if validation fails
          prefixIcon: Icon(icon), // Icon for the text field
        ),
        obscureText: isPassword, // Hide password text
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}
