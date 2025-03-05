import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/utilities/textStyles.dart';
import 'package:graduate_plus/widgets/gridViewCardWidget.dart';

class QR_DC_DiscoveryToolScreenView extends StatefulWidget {
  final bool qrDiscoveryScreen;
  const QR_DC_DiscoveryToolScreenView(
      {super.key, required this.qrDiscoveryScreen});

  @override
  State<QR_DC_DiscoveryToolScreenView> createState() =>
      _QR_DC_DiscoveryToolScreenViewState();
}

class _QR_DC_DiscoveryToolScreenViewState
    extends State<QR_DC_DiscoveryToolScreenView> {
  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size; // Get the screen size for responsive UI

    return Scaffold(
      // App Bar with a back button and logo
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Transparent to blend with the design
        elevation: 0, // No shadow for a cleaner look
        leading: IconButton(
          icon:
              Icon(CupertinoIcons.back, color: blackColor), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        titleSpacing: 0, // Align title with the leading icon
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
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Add horizontal padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner Section (Image at the top)
              Container(
                height: 79, // Set fixed height for the banner
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  image: DecorationImage(
                    image: AssetImage(widget.qrDiscoveryScreen
                        ? 'assets/images/bcuQues.png'
                        : 'assets/images/bcuDigital.png'), // Background image
                    fit: BoxFit.cover, // Ensure image fits well
                  ),
                ),
              ),
              SizedBox(height: 16.0), // Add spacing below the banner

              // Title Section - Displays the main heading
              Text(
                widget.qrDiscoveryScreen
                    ? 'Question sets and report for students'
                    : 'What are digital capabilities?',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8), // Add small space below the title

              // Profile & Interaction Row (Author, Likes, Bookmark, Share)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Profile picture and author name
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(100), // Circular image
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: whiteColor,
                            border: Border.all(
                                color: blackColor), // Border around the image
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
                        "Jisc", // Name of the author/organization
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
              SizedBox(height: 16.0), // Add space below the profile row

              // Description Section - Brief overview of the resource
              Text(
                widget.qrDiscoveryScreen
                    ? 'Below you will find a range of resources that have been mapped to the different elements of the digital capability framework and other elements used in the question sets.'
                    : 'Digital capability is the term we use to describe the skills and attitudes that individuals and organisations need if they are to thrive in todays world.'
                        'This short (2 minute) video helps to explain why it is important to think about your digital capabilities:',
                style: TextStyle(fontSize: 14.0, color: Colors.grey.shade600),
              ),
              SizedBox(height: widget.qrDiscoveryScreen ? 0 : 16),
              widget.qrDiscoveryScreen
                  ? SizedBox()
                  : Container(
                      height: 200, // Set fixed height for the banner
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(8.0), // Rounded corners
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/bcuYT.png'), // Background image
                          fit: BoxFit.cover, // Ensure image fits well
                        ),
                      ),
                    ),
              SizedBox(height: 16.0), // Space before listing sections

              GridView.builder(
                shrinkWrap:
                    true, // Ensures GridView doesn't take unnecessary space
                physics:
                    NeverScrollableScrollPhysics(), // Prevents GridView from scrolling separately
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 16.0, // Space between columns
                  mainAxisSpacing: 16.0, // Space between rows
                  childAspectRatio: 0.8, // Controls item size
                ),
                itemCount: 4, // Number of items in the grid
                itemBuilder: (context, index) {
                  return GridViewCardWidget(
                    postedBy: "", // No author details needed for these cards
                    postedDate: "", // No specific post date
                    imagePath: 'assets/images/bcuFB.png', // Placeholder image
                    title: index % 2 == 0
                        ? 'Question sets and reports for students' // Alternating titles for demo
                        : 'Give feedback - it only takes 2 minutes',
                    likes: 213, // Sample likes count
                    hasLogo: true, // Indicates if logo should be displayed
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

// Section Widget - Displays a grid of items in a category
class SectionWidget extends StatelessWidget {
  final String title; // Title of the section
  final int itemCount; // Number of items in the grid

  const SectionWidget({required this.title, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0), // Space between title and grid

        // Grid of Resource Items
        GridView.builder(
          shrinkWrap: true, // Ensures GridView doesn't take unnecessary space
          physics:
              NeverScrollableScrollPhysics(), // Prevents GridView from scrolling separately
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 16.0, // Space between columns
            mainAxisSpacing: 16.0, // Space between rows
            childAspectRatio: 0.8, // Controls item size
          ),
          itemCount: itemCount, // Number of items in the grid
          itemBuilder: (context, index) {
            return GridViewCardWidget(
              postedBy: "", // No author details needed for these cards
              postedDate: "", // No specific post date
              imagePath: 'assets/images/bcuFB.png', // Placeholder image
              title: index % 2 == 0
                  ? 'Question sets and reports for students' // Alternating titles for demo
                  : 'Give feedback - it only takes 2 minutes',
              likes: 213, // Sample likes count
              hasLogo: true, // Indicates if logo should be displayed
            );
          },
        ),
      ],
    );
  }
}
