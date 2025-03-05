import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/utilities/commonButton.dart';
import 'package:graduate_plus/utilities/customTextField.dart';
import 'package:graduate_plus/utilities/textStyles.dart';
import 'package:graduate_plus/widgets/chooseProfileImageBottomSheet.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileScreenView extends StatefulWidget {
  @override
  State<UpdateProfileScreenView> createState() =>
      _UpdateProfileScreenViewState();
}

class _UpdateProfileScreenViewState extends State<UpdateProfileScreenView> {
  // Variable to store the selected image file
  File? selectedImage;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // App bar with a back button and title
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
      body: Column(
        children: [
          Expanded(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification.disallowIndicator(); // Prevent overscroll glow
                return true;
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Update Profile',
                      style: TextStyle(
                        fontSize: 24.0, // Font size
                        fontWeight: FontWeight.bold, // Bold text
                        color: Colors.black, // Text color
                      ),
                    ),
                    SizedBox(height: 20),
                    // Profile image selection
                    Stack(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black.withOpacity(.9),
                              width: 1,
                            ),
                          ),
                          child: ClipOval(
                            child: (selectedImage != null)
                                ? Image.file(
                                    selectedImage!,
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    color: darkBlue,
                                    child: const Icon(
                                      Icons.person,
                                      size: 60,
                                    ),
                                  ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: InkWell(
                            onTap: () async {
                              final result = await showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    topLeft: Radius.circular(12),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  return chooseProfileImagesBottomSheet(
                                    context,
                                  );
                                },
                              );
                              if (result != null) {
                                chooseImage(type: result, context: context);
                              }
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                              child: Container(
                                height: 40,
                                width: 40,
                                color: Colors.black,
                                child: const Center(
                                  child: Icon(
                                    Icons.camera_alt_rounded,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // User Email input field
                    CustomTextField(
                      controller: emailController, // Controller for email input
                      hintText: 'Enter your email', // Placeholder text
                      prefixIcon: Icons.mail_outline, // Mail icon
                    ),
                    SizedBox(height: 10),

                    // User Name input field
                    CustomTextField(
                      controller: nameController, // Controller for email input
                      hintText: 'Enter your name', // Placeholder text
                      prefixIcon: Icons.abc, // Mail icon
                    ),
                    SizedBox(height: 10),

                    // Bio input field
                    CustomTextField(
                      controller: bioController,
                      hintText: 'Enter your bio detail', // Placeholder text
                      prefixIcon: Icons.density_small_rounded, // Mail icon
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
            ),
          ),

          // Update Profile button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: commonButton(context: context, label: "Update Profile"),
          ),
        ],
      ),
    );
  }

  // Function to choose an image from gallery or camera
  Future<void> chooseImage(
      {required String type, required BuildContext context}) async {
    final picker = ImagePicker();
    final pickedImage = type == "camera"
        ? await picker.pickImage(source: ImageSource.camera)
        : await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path); // Update the selected image
      });
    }
  }
}
