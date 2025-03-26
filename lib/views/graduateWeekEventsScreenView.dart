import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/utilities/services/dataService.dart';
import 'package:graduate_plus/widgets/eventsGridViewCardWidget.dart';

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
            EventsGridViewCardWidgets(
              hasLogo: true,
              postedBy: '',
              nextScreen: '',
              postedDate: '',
              events: DataService.fetchSingleIntroEvent(),
            ),
            SizedBox(height: 16.0), // Spacer after the grid view

            // Section for suggested events by course
            _buildSectionTitle(
              "Suggested Graduate+ Week Events by Course",
              "Arts, Design, and Media Courses",
            ),
            EventsGridViewCardWidgets(
              hasLogo: true,
              postedBy: '',
              nextScreen: 'detail',
              postedDate: '',
              events: DataService.fetchArtEvents(),
            ),

            SizedBox(height: 24.0), // Spacer between sections

            // Section for suggested events by area of development
            _buildSectionTitle(
              "",
              "Business, Law and Social Sciences Courses",
            ),
            EventsGridViewCardWidgets(
              hasLogo: true,
              postedBy: '',
              nextScreen: 'detail',
              postedDate: '',
              events: DataService.fetchBusinessEvents(),
            ),
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
}
