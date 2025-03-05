import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/utilities/commonButton.dart';

/// A StatelessWidget that provides a screen for users to upload posts with a title,
/// description, images, and related files.
class PostUploadScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with a transparent background and no elevation (flat appearance)
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Makes the app bar background transparent
        elevation: 0, // Removes shadow under the app bar
        leading: IconButton(
          icon:
              Icon(CupertinoIcons.back, color: blackColor), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        titleSpacing:
            0, // Removes extra spacing between leading widget and title
        title: Row(
          children: [
            // Displays the logo on the app bar
            Image.asset(
              'assets/images/bcuLogo.png',
              height: 40.0, // Adjusts logo height
            ),
          ],
        ),
      ),

      // Main body of the screen
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // Adds uniform padding around the body
        child: SingleChildScrollView(
          // Makes the screen scrollable to prevent overflow when the keyboard appears
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Aligns content to the start
            children: [
              /// --------------------------- Post Title Input ---------------------------
              TextField(
                decoration: InputDecoration(
                  labelText: 'Post Title', // Placeholder label for title input
                  prefixIcon: Icon(Icons.title), // Icon inside the input field
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0), // Rounded border
                  ),
                ),
              ),
              SizedBox(height: 16.0), // Spacing between fields

              /// ------------------------ Post Description Input ------------------------
              TextField(
                maxLines: 5, // Allows multiline input for detailed description
                decoration: InputDecoration(
                  labelText: 'Post Description', // Placeholder label
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0), // Rounded border
                  ),
                ),
              ),
              SizedBox(height: 16.0), // Spacing between sections

              /// -------------------------- Upload Post Images --------------------------
              Text(
                'Upload Post Images', // Section title
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 8.0),

              // Container for image upload area
              Container(
                padding: EdgeInsets.all(12.0),
                width: double.infinity, // Takes full width of parent
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Grey border outline
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                ),
                child: Column(
                  children: [
                    // Instruction text for users
                    Text(
                      'Tap on boxes to upload images (multiple supported)',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                    SizedBox(height: 12.0), // Spacing before upload boxes

                    // Displays 3 upload boxes using a Wrap for responsive layout
                    Wrap(
                      spacing: 8.0, // Horizontal space between boxes
                      runSpacing: 8.0, // Vertical space when wrapping
                      children: List.generate(3, (index) {
                        return Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(8.0), // Rounded boxes
                            color:
                                Colors.grey.shade200, // Light grey background
                          ),
                          child: Center(
                            child: Icon(
                              Icons.image, // Image icon indicating upload area
                              color: Colors.grey,
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0), // Spacing after images section

              /// ---------------------- Upload Post Related Files -----------------------
              Text(
                'Upload Post Related Files', // Section title
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 8.0),

              // Container for file upload area
              Container(
                width: double.infinity, // Takes full width of parent
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Grey border
                  borderRadius: BorderRadius.circular(12.0), // Rounded edges
                ),
                child: Column(
                  children: [
                    // Instruction text for file uploads
                    Text(
                      'Tap on boxes to upload files (PDF, Word, etc.)',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                    SizedBox(height: 12.0), // Space before file boxes

                    // Displays 2 file upload containers using Wrap for responsiveness
                    Wrap(
                      spacing: 8.0, // Horizontal spacing
                      runSpacing: 8.0, // Vertical spacing
                      children: List.generate(2, (index) {
                        return Container(
                          padding:
                              EdgeInsets.all(8.0), // Padding inside each box
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(8.0), // Rounded corners
                            color:
                                Colors.grey.shade200, // Light grey background
                          ),
                          child: Row(
                            mainAxisSize:
                                MainAxisSize.min, // Wraps to fit content
                            children: [
                              Icon(Icons.file_present,
                                  color: Colors.grey), // File icon
                              SizedBox(
                                  width: 8.0), // Space between icon and text
                              Text(
                                'File ${index + 1}', // Dynamic file label
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.0), // Spacing before the button

              /// ---------------------------- Add Post Button ----------------------------
              commonButton(
                context: context,
                label:
                    "Add Post", // Calls a common button widget to submit post
              ),
            ],
          ),
        ),
      ),
    );
  }
}
