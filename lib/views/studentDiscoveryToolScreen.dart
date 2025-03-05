// Import necessary Flutter packages for UI components
import 'package:flutter/cupertino.dart'; // Provides Cupertino (iOS-style) widgets
import 'package:flutter/material.dart'; // Core Flutter UI components

// Import custom utilities and widgets
import 'package:graduate_plus/utilities/appColors.dart'; // Contains predefined color values
import 'package:graduate_plus/views/feedbackDiscoveryToolScreenView.dart';
import 'package:graduate_plus/views/q_rDiscoveryToolScreenView.dart';
import 'package:graduate_plus/views/r_b_sDiscoveryToolScreenView.dart';
import 'package:graduate_plus/widgets/gridViewCardWidget.dart'; // Custom widget for displaying grid items

// Main screen for the Student Discovery Tool, which guides students through digital development resources
class StudentDiscoveryToolScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve screen width and height for responsive design
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // AppBar with a back button and logo
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent for a cleaner look
        elevation: 0, // Removes shadow
        leading: IconButton(
          icon:
              Icon(CupertinoIcons.back, color: blackColor), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        titleSpacing: 0, // Align title with leading icon
        title: Row(
          children: [
            Image.asset(
              'assets/images/bcuLogo.png', // Display BCU logo
              height: 40.0,
            ),
          ],
        ),
      ),

      // Main body wrapped in a scrollable view
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Uniform padding around content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner Section - Displays an image at the top
              Container(
                width: screenWidth, // Take full screen width
                height: 79, // Fixed height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/bcuDTFS.png'), // Background image
                    fit: BoxFit
                        .contain, // Ensures full visibility without cropping
                  ),
                ),
              ),
              SizedBox(height: 16.0), // Space below the banner

              // Title Section
              Text(
                'Welcome to the Jisc discovery tool',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 8.0), // Space between title and description

              // Instructional Text - Steps for students
              Text(
                '1. Start your journey by selecting the question sets and reports panel. Your personalised report will appear when you complete a question set.',
                style: TextStyle(
                    fontSize: 14.0, color: blackColor.withOpacity(0.7)),
              ),
              SizedBox(height: 4.0),
              Text(
                '2. Next, use the resource bank to search for and access resources that will aid your digital development.',
                style: TextStyle(
                    fontSize: 14.0, color: blackColor.withOpacity(0.7)),
              ),
              SizedBox(height: 4.0),
              Text(
                '3. To re-visit your personalised reports, select the question sets and reports panel. You will be able to access your report within each question set.',
                style: TextStyle(
                    fontSize: 14.0, color: blackColor.withOpacity(0.7)),
              ),
              SizedBox(height: 8.0),
              Text(
                'If you need any help, please take a look at our guidance for students and staff.',
                style: TextStyle(
                    fontSize: 14.0, color: blackColor.withOpacity(0.7)),
              ),
              SizedBox(height: 16.0), // Space before grid section

              // Grid View - Displays cards for different resources
              GridView.builder(
                shrinkWrap: true, // Allows GridView to be wrapped inside Column
                physics:
                    NeverScrollableScrollPhysics(), // Prevents internal scrolling
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 16.0, // Space between columns
                  mainAxisSpacing: 16.0, // Space between rows
                  childAspectRatio: 0.8, // Controls item size
                ),
                itemCount: 4, // Number of items in this grid
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  QR_DC_DiscoveryToolScreenView(
                                qrDiscoveryScreen: true,
                              ),
                            ),
                          );
                          break;
                        case 1:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RBSDiscoveryToolScreenView(),
                            ),
                          );
                          break;
                        case 2:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  QR_DC_DiscoveryToolScreenView(
                                qrDiscoveryScreen: false,
                              ),
                            ),
                          );
                          break;
                        case 3:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FeedbackDiscoveryToolScreenView(),
                            ),
                          );
                          break;
                      }
                    },
                    child: GridViewCardWidget(
                      postedBy: "", // No author details needed
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
