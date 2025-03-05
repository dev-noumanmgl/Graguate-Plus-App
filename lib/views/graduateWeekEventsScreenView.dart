import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/utilities/textStyles.dart';
import 'package:graduate_plus/views/graduateWeekEventDetailScreenView.dart';
import 'package:graduate_plus/widgets/gridViewCardWidget.dart';

/// A stateless widget representing the Graduate+ Week Events Screen.
class GraduateWeekEventsScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with transparent background and no shadow
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon:
              Icon(CupertinoIcons.back, color: blackColor), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        titleSpacing: 0,
        title: Image.asset(
          // BCU logo displayed in the app bar
          'assets/images/bcuLogo.png',
          height: 40.0,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0), // Padding around the entire body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Section with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/images/graduatePlusHeader.png',
                width: double.infinity,
                fit: BoxFit.cover, // Ensures the image covers the entire width
              ),
            ),
            SizedBox(height: 16.0), // Spacer between banner and title

            // Centered title for the event
            Center(
              child: Text(
                "GRADUATE+ WEEK (November 4th - 8th)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: darkBlue,
                ),
              ),
            ),
            SizedBox(height: 8.0), // Space between title and description

            // Description Section highlighting the event details
            Text(
              "Our full programme for the upcoming Graduate+ week is out now!",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0), // Spacer

            // First descriptive paragraph
            Text(
              "Graduate+ Week is a fantastic opportunity for you to develop as more well-rounded students. Across the week, across both campuses and online, explore an exciting range of activities that will expand your horizons, develop your skills, and complete your student experience!",
              style: TextStyle(fontSize: 14.0, color: Colors.black87),
            ),
            SizedBox(height: 8.0), // Spacer

            // Second descriptive paragraph
            Text(
              "If you haven’t come across the programme, this is an ideal opportunity to engage with BCU’s extra and co-curricular awards framework. Academics across all courses will be encouraging you to engage with the activities we have on offer that cover the gamut of experiences such as developing your academic skills, improving your employability, or exploring volunteering and mentoring opportunities.",
              style: TextStyle(fontSize: 14.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0), // Space before the grid view

            // Grid view displaying a single event card
            GridView.builder(
              shrinkWrap:
                  true, // Ensures the GridView takes up only required space
              physics:
                  NeverScrollableScrollPhysics(), // Prevents inner scrolling
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two cards per row
                crossAxisSpacing: 16.0, // Horizontal space between cards
                mainAxisSpacing: 16.0, // Vertical space between cards
                childAspectRatio: 0.8, // Aspect ratio of the cards
              ),
              itemCount: 1, // Number of items in the grid
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GraduateWeekEventDetailScreenView(),
                        ));
                  },
                  child: GridViewCardWidget(
                    postedBy: "", // Placeholder for posted by information
                    postedDate: "", // Placeholder for posted date
                    imagePath: 'assets/images/bcuFB.png', // Event image
                    title: index % 2 == 0
                        ? 'Question sets and reports for students'
                        : 'Give feedback - it only takes 2 minutes', // Alternating titles
                    likes: 213, // Number of likes for the event
                    hasLogo: true, // Displays a logo if true
                  ),
                );
              },
            ),
            SizedBox(height: 16.0), // Spacer after the grid view

            // Section for suggested events by course
            _buildSectionTitle(
              "Suggested Graduate+ Week Events by Course",
              "Arts, Design, and Media Courses",
            ),
            _buildGridView(context), // Grid of suggested events

            SizedBox(height: 24.0), // Spacer between sections

            // Section for suggested events by area of development
            _buildSectionTitle(
              "",
              "Business, Law and Social Sciences Courses",
            ),
            _buildGridView(context), // Grid of suggested events
          ],
        ),
      ),
    );
  }

  /// Helper function to build section titles
  /// [title] is the main title, [subTitle] is a secondary subtitle
  Widget _buildSectionTitle(String title, String subTitle) {
    return Column(
      children: [
        // Display the title only if it's not empty
        title.isEmpty
            ? SizedBox() // Empty space if title is empty
            : Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: darkBlue,
                ),
              ),
        // Display the subtitle only if it's not empty
        subTitle.isEmpty
            ? SizedBox()
            : Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
              ),
        SizedBox(height: 4), // Space below the titles
      ],
    );
  }

  /// Helper function to build a grid view for events.
  /// This displays two event cards per row with defined spacing.
  Widget _buildGridView(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Ensures it takes minimal vertical space
      physics:
          NeverScrollableScrollPhysics(), // Prevents nested scrolling issues
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two cards per row
        crossAxisSpacing: 16.0, // Space between cards horizontally
        mainAxisSpacing: 16.0, // Space between cards vertically
        childAspectRatio: 0.8, // Controls the width-to-height ratio of cards
      ),
      itemCount: 2, // Number of items displayed in the grid
      itemBuilder: (context, index) {
        return GridViewCardWidget(
          postedBy: "", // Placeholder for posted by information
          postedDate: "", // Placeholder for posted date
          imagePath: 'assets/images/bcuFB.png', // Image displayed on the card
          title: index % 2 == 0
              ? 'Question sets and reports for students'
              : 'Give feedback - it only takes 2 minutes', // Alternates titles based on index
          likes: 213, // Number of likes displayed
          hasLogo: true, // Shows logo if true
        );
      },
    );
  }
}
