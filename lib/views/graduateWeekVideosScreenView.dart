import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/utilities/textStyles.dart';
import 'package:graduate_plus/widgets/gridViewCardWidget.dart';

class GraduateWeekVideosScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with a back button and logo
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Transparent background for a clean look
        elevation: 0, // Removes the shadow under the AppBar
        leading: IconButton(
          icon:
              Icon(CupertinoIcons.back, color: blackColor), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        titleSpacing: 0, // Removes spacing between leading icon and title
        title: Image.asset(
          'assets/images/bcuLogo.png', // Displays the BCU logo
          height: 40.0,
        ),
      ),

      // Main content inside a scrollable view
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0), // Adds padding around the body
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns content to the start (left)
          children: [
            // Banner Section - Displays the event banner
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(12.0), // Rounded corners for the banner
              child: Image.asset(
                'assets/images/bcuFreelancingCourse.png', // Banner image path
                width: double.infinity, // Occupies full width of the screen
                height: 160, // Fixed height for consistency
                fit: BoxFit.cover, // Covers entire box without distortion
              ),
            ),
            SizedBox(height: 16.0), // Space between banner and title

            // Title Section
            Center(
              child: Text(
                "Videos", // Main title
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: darkBlue, // Custom dark blue color from appColors
                ),
              ),
            ),
            SizedBox(height: 8.0), // Space between title and description

            // Description Section
            Text(
              "These are all the videos from the Grad+ weeks in the past.", // Brief description
              style: TextStyle(fontSize: 14.0, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper function to build section titles.
  /// [title] - Main title text.
  /// [subTitle] - Subtitle text displayed below the title.
  Widget _buildSectionTitle(String title, String subTitle) {
    return Column(
      children: [
        // Checks if title is not empty before displaying it
        title.isNotEmpty
            ? Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: darkBlue,
                ),
              )
            : SizedBox(), // If title is empty, render an empty widget

        // Checks if subtitle is not empty before displaying it
        subTitle.isNotEmpty
            ? Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
              )
            : SizedBox(), // If subtitle is empty, render an empty widget

        SizedBox(height: 4), // Space between titles and next content
      ],
    );
  }

  /// Helper function to build a grid view for video cards.
  /// Displays video-related cards in a 2-column grid.
  Widget _buildGridView(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Ensures the grid takes only the necessary space
      physics:
          NeverScrollableScrollPhysics(), // Disables internal scrolling to avoid conflict with parent scroll
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns in the grid
        crossAxisSpacing: 16.0, // Horizontal spacing between grid items
        mainAxisSpacing: 16.0, // Vertical spacing between grid items
        childAspectRatio: 0.8, // Controls the size ratio of grid items
      ),
      itemCount: 2, // Number of items to display in the grid
      itemBuilder: (context, index) {
        // Builds each card item with conditional title text
        return GridViewCardWidget(
          postedBy: "", // Placeholder for future poster details
          postedDate: "", // Placeholder for future date details
          imagePath: 'assets/images/bcuFB.png', // Image displayed on the card
          title: index % 2 == 0
              ? 'Question sets and reports for students'
              : 'Give feedback - it only takes 2 minutes', // Alternating card titles
          likes: 213, // Example like count
          hasLogo: true, // Displays logo on the card if true
        );
      },
    );
  }
}
