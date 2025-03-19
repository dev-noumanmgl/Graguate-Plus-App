// Importing necessary Flutter packages
import 'package:flutter/cupertino.dart'; // For iOS-style widgets like the back icon
import 'package:flutter/material.dart'; // For Material Design widgets
import 'package:graduate_plus/utilities/appColors.dart'; // Custom color definitions
import 'package:graduate_plus/utilities/services/dataService.dart';
import 'package:graduate_plus/views/courseDetailsScreenView.dart';
import 'package:graduate_plus/views/eventsDetailScreen.dart';
import 'package:graduate_plus/widgets/gridViewCardWidget.dart';
import 'package:graduate_plus/widgets/courseGridViewCardWidgets.dart'; // Custom widget for grid view cards

// Main widget for the Embedded Courses screen
class EmbeddedCoursesScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with transparent background and back button
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Transparent background for a modern look
        elevation: 0, // Removes shadow for a cleaner design
        leading: IconButton(
          icon:
              Icon(CupertinoIcons.back, color: blackColor), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        titleSpacing: 0, // Removes default spacing for title alignment
        title: Image.asset(
          'assets/images/bcuLogo.png', // BCU logo displayed in the app bar
          height: 40.0, // Logo height
        ),
      ),

      // Main body with scrollable content
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0), // Consistent padding for the entire body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Left-aligns children
          children: [
            // Header image with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(
                  12.0), // Rounded edges for smooth visuals
              child: Image.asset(
                height: 70,
                'assets/images/graduatePlusHeader.png', // Header/banner image
                width: double.infinity, // Makes the image span full width
                fit: BoxFit
                    .contain, // Scales the image to cover the space without distortion
              ),
            ),
            SizedBox(height: 16.0), // Spacing after the header image

            // Title for the course module award activities section
            Text(
              'Course Module Award Activities', // Section heading
              style: TextStyle(
                fontSize: 20.0, // Larger font size for emphasis
                fontWeight: FontWeight.bold, // Bold text for importance
                color: Colors.black, // Black color for good contrast
              ),
            ),
            SizedBox(height: 8.0), // Spacing after the title

            // Subtitle providing additional information
            Text(
              'Specific award activities relevant to your degree programme and modules can be found below.',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87), // Descriptive text with softer black
            ),
            SizedBox(height: 16.0), // Spacing before the grid view

            GridViewCardWidgets(
              hasLogo: true,
              postedBy: '',
              nextScreen: 'course',
              postedDate: '',
              futureCourses: DataService.fetchCourses(),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build a custom award card (not used in current UI but available for future use)
  Widget _buildAwardCard(String title, int likes, String imagePath) {
    return Card(
      elevation: 4.0, // Adds shadow for depth
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(12.0), // Rounded edges for a modern look
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Left-align contents
        children: [
          // Card image with rounded top corners
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.asset(
              imagePath, // Image path provided in the parameters
              height: 100.0, // Fixed height for consistency
              width: double.infinity, // Full width inside the card
              fit: BoxFit.cover, // Ensures the image covers the space nicely
            ),
          ),
          Padding(
            padding:
                EdgeInsets.all(8.0), // Padding for the text and icon section
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Aligns text to the left
              children: [
                // Title text with ellipsis overflow
                Text(
                  title, // Dynamic title passed to the function
                  style: TextStyle(
                    fontSize: 14.0, // Readable font size
                    fontWeight: FontWeight.bold, // Bold for emphasis
                    color: Colors.black, // Black color for consistency
                  ),
                  maxLines: 2, // Limits the text to two lines
                  overflow: TextOverflow
                      .ellipsis, // Truncates overflowed text with "..."
                ),
                SizedBox(height: 8.0), // Spacing before the likes row

                // Likes row with icon and count
                Row(
                  children: [
                    Icon(Icons.thumb_up,
                        size: 16.0, color: Colors.grey), // Like icon
                    SizedBox(width: 4.0), // Space between icon and text
                    Text(
                      likes.toString(), // Displays the number of likes
                      style: TextStyle(
                        fontSize: 14.0, // Font size for consistency
                        color: Colors.black87, // Slightly softer black for text
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
