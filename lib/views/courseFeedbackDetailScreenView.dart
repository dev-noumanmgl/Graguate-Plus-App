// Import necessary Flutter packages for UI components
import 'package:flutter/cupertino.dart'; // Provides iOS-style widgets
import 'package:flutter/material.dart'; // Core Flutter UI components

// Import custom utilities for colors, text styles, and widgets
import 'package:graduate_plus/utilities/appColors.dart'; // Contains predefined color values
import 'package:graduate_plus/utilities/textStyles.dart'; // Contains predefined text styles
import 'package:graduate_plus/widgets/gridViewCardWidget.dart'; // Custom widget for displaying grid items

// Main screen for the RBS Discovery Tool, which presents a categorized list of digital resources
class Coursefeedbackdetailscreenview extends StatelessWidget {
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
                '2. Attend an industry panel event.', // Page title
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
                      Icon(CupertinoIcons.arrow_down_to_line,
                          size: 20.0, color: Colors.black), // Download icon
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0), // Space below the profile section

              // Description Section - Provides an overview of the available resources
              Text(
                'During the week the alumni and guest speakers will share there experiences of getting into the industry. Attend one of these events and reflect on what you have learned.',
                style: TextStyle(fontSize: 14.0, color: Colors.grey.shade600),
              ),
              SizedBox(height: 16.0), // Space before listing sections
              Text(
                "Provide evidence of your attendance by reflecting on this panel event: what I learned from this was ...",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: blackColor),
              ),
              SizedBox(height: 8.0),

              // Word Count
              Text(
                '0 / 200 words',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8.0),

              // Text Input Box
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Type here...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
