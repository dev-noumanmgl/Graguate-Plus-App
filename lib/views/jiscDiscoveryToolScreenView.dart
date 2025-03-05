// Importing necessary Flutter packages
import 'package:flutter/cupertino.dart'; // For iOS-style widgets
import 'package:flutter/material.dart'; // For Material Design widgets
import 'package:graduate_plus/utilities/appColors.dart'; // Custom color utilities
import 'package:graduate_plus/views/studentDiscoveryToolScreen.dart';
import 'package:graduate_plus/widgets/gridViewCardWidget.dart'; // Custom widget for grid view cards (not used in this code but imported for future use)

// Stateless widget for the Jisc Discovery Tool screen
class JiscDiscoveryToolScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with transparent background and no elevation for a clean look
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 0, // No shadow
        leading: IconButton(
          icon:
              Icon(CupertinoIcons.back, color: blackColor), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        titleSpacing: 0, // Removes default spacing for the title
        title: Image.asset(
          'assets/images/bcuLogo.png', // Displays the BCU logo
          height: 40.0, // Logo height
        ),
      ),

      // Main content area with padding
      body: Padding(
        padding: EdgeInsets.all(16.0), // Uniform padding around the content
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the start (left)
          children: [
            // Header banner image with rounded corners
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(12.0), // Rounded edges for image
              child: Image.asset(
                'assets/images/jisc.png', // Banner image path
                width: double.infinity, // Full width
                fit: BoxFit.cover, // Cover the entire container area
              ),
            ),
            SizedBox(height: 16.0), // Spacing between widgets

            // Title section
            Text(
              'Welcome to the Jisc discovery tool', // Main title text
              style: TextStyle(
                fontSize: 20.0, // Font size for emphasis
                fontWeight: FontWeight.bold, // Bold text for prominence
                color: Colors.black, // Black color for readability
              ),
            ),
            SizedBox(height: 8.0), // Spacing below the title

            // Subtitle section with description
            Text(
              'Explore the question sets and resources available to you by selecting the discovery tool tile below. If you need any help, please take a look at our guidance pages.', // Informative text
              style: TextStyle(
                fontSize: 16.0, // Slightly smaller font for body text
                color: Colors.black87, // Softer black for less visual strain
              ),
            ),
            SizedBox(height: 16.0), // Spacing before the discovery tool tile

            // Discovery Tool Tile
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentDiscoveryToolScreen(),
                    ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width /
                    2.3, // Responsive width for the tile
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      8.0), // Rounded corners for the tile
                  border: Border.all(
                    color: greyColor
                        .withOpacity(0.3), // Subtle border for definition
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip
                      .none, // Allows children to overflow the widget bounds if needed
                  children: [
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Left-align contents
                      children: [
                        // Top image for the tile with rounded top edges
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(
                                8.0), // Rounded corners at the top
                          ),
                          child: Image.asset(
                            "assets/images/bcuDiscToolPic.png", // Image for the discovery tool
                            height: 120.0, // Fixed height
                            width: double.infinity, // Full width of the tile
                            fit: BoxFit
                                .cover, // Ensures the image covers the area without distortion
                          ),
                        ),
                        // Text section below the image
                        Padding(
                          padding: const EdgeInsets.all(
                              8.0), // Padding inside the tile
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start, // Left-align text
                            children: [
                              SizedBox(height: 10), // Space above the text
                              Text(
                                "Discovery tool for students", // Tile title
                                textAlign: TextAlign
                                    .center, // Center-aligns the text inside its container
                                style: TextStyle(
                                  fontSize:
                                      14.0, // Font size suitable for tile text
                                  fontWeight:
                                      FontWeight.bold, // Bold for emphasis
                                  color: blackColor, // Custom black color
                                ),
                                maxLines: 2, // Limits text to two lines
                                overflow: TextOverflow
                                    .ellipsis, // Adds "..." if the text is too long
                              ),
                              SizedBox(
                                  height:
                                      8.0), // Spacing below the text for visual balance
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
