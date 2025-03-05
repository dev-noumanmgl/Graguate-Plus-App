// Import necessary Flutter packages for UI components
import 'package:flutter/cupertino.dart'; // Provides iOS-style widgets
import 'package:flutter/material.dart'; // Core Flutter UI components

// Import custom utilities for colors, text styles, and widgets
import 'package:graduate_plus/utilities/appColors.dart'; // Contains predefined color values
import 'package:graduate_plus/utilities/textStyles.dart'; // Contains predefined text styles
import 'package:graduate_plus/views/courseFeedbackDetailScreenView.dart';
import 'package:graduate_plus/widgets/gridViewCardWidget.dart'; // Custom widget for displaying grid items

// Main screen for the RBS Discovery Tool, which presents a categorized list of digital resources
class Coursedetailsscreenview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size; // Get screen size for responsive layout

    return Scaffold(
      // App Bar with a back button and a logo
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Transparent to blend with the design
        elevation: 0, // Remove shadow for a cleaner look
        leading: IconButton(
          icon:
              Icon(CupertinoIcons.back, color: blackColor), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        titleSpacing: 0, // Align title with the leading icon
        title: Image.asset(
          'assets/images/bcuLogo.png', // Display BCU logo
          height: 40.0,
        ),
      ),

      // Main body wrapped in a scrollable view
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Add horizontal padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner Section - Displays an image at the top
              Container(
                height: 79, // Fixed height for the banner
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/bcuFreelancingCourse.png'), // Background image
                    fit: BoxFit.cover, // Ensures image fits without cropping
                  ),
                ),
              ),
              SizedBox(height: 16.0), // Add spacing below the banner

              // Title Section - Displays the main heading of the page
              Text(
                'Freelancers\' Fair 2024', // Page title
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8), // Space between title and profile section

              // Profile & Interaction Row - Shows author and interaction buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Profile Picture and Author Name
                  Row(
                    children: [
                      // Circular Profile Image
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(100), // Rounded image
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(
                                color:
                                    blackColor), // Black border around the image
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/bcuLogo1.png", // Profile image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8), // Space between image and text
                      Text(
                        "Jisc", // Author/Organization name
                        style: textStyleBold(blackColor),
                      ),
                    ],
                  ),

                  // Interaction Icons (Likes, Bookmark, Download, Share)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.heart_fill,
                          size: 22.0, color: darkBlue), // Like icon
                      SizedBox(width: 4.0),
                      Text('592'), // Like count

                      SizedBox(width: 16.0),
                      Icon(CupertinoIcons.bookmark_fill,
                          size: 18.0, color: darkBlue), // Bookmark icon

                      SizedBox(width: 16.0),
                      Icon(CupertinoIcons.arrow_down_to_line,
                          size: 20.0, color: Colors.black), // Download icon

                      SizedBox(width: 16.0),
                      Icon(CupertinoIcons.share,
                          size: 20.0, color: Colors.black), // Share icon
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0), // Space below the profile section

              // Description Section - Provides an overview of the available resources
              Text(
                'The Freelancers\' Fair happens during Grad+ Week (Week 7). It provides a week-long series of activities that help students with employability. We invite alumni who are working in the industry, and industry specialists to provide advice and workshops mainly for students who are studying film (or \'screen’ production – VFX students).\n This playlist includes all the activities that you could do as part of this week.',
                style: TextStyle(fontSize: 14.0, color: Colors.grey.shade600),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        child: Container(height: 6, color: darkBlue)),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "0%",
                    style: TextStyle(fontSize: 16.0, color: blackColor),
                  )
                ],
              ),
              SizedBox(height: 16.0), // Space before listing sections

              GridView.builder(
                shrinkWrap:
                    true, // Ensures GridView doesn't take unnecessary space
                physics:
                    NeverScrollableScrollPhysics(), // Prevents scrolling within the grid
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 16.0, // Space between columns
                  mainAxisSpacing: 16.0, // Space between rows
                  childAspectRatio: 0.8, // Controls item size
                ),
                itemCount: 6, // Number of items in this grid
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Coursefeedbackdetailscreenview(),
                          ));
                    },
                    child: GridViewCardWidget(
                      postedBy: "", // No author details needed for these cards
                      postedDate: "", // No specific post date
                      imagePath: 'assets/images/bcuFB.png', // Placeholder image
                      title: index % 2 == 0
                          ? 'Question sets and reports for students' // Alternating titles
                          : 'Give feedback - it only takes 2 minutes',
                      likes: 213, // Sample likes count
                      hasLogo:
                          true, // Indicates if the logo should be displayed
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
