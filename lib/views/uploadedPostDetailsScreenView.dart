import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';

class UploadedPostDetailsScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // App Bar Section
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Removes shadow under the AppBar
        leading: IconButton(
          icon:
              Icon(CupertinoIcons.back, color: blackColor), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        titleSpacing: 0, // Removes default spacing before title
        title: Row(
          children: [
            Image.asset(
              'assets/images/bcuLogo.png',
              height: 40.0, // Sets height for the logo
            ),
          ],
        ),
      ),

      // Body Content
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Post Header with Image Thumbnail and Author Information
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'assets/images/coverPic.png',
                      width: double.infinity,
                      height: 200.0,
                      fit: BoxFit
                          .cover, // Ensures the image covers the container
                    ),
                  ),
                  // Overlay container displaying post author
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        color: blackColor
                            .withOpacity(0.7), // Semi-transparent background
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Posted by:",
                            style: TextStyle(color: whiteColor),
                          ),
                          Text(
                            'Pardeep Singh', // TODO: Replace with dynamic username
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),

              // Post Title
              Text(
                'Action for Happiness', // TODO: Replace with dynamic post title
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 8.0),

              // Post Description
              Text(
                'We all deserve the chance to be happy.\n\nThe cost of living is a big challenge right now. Here at Action for Happiness we want to make the life-changing science of happiness available to everyone.',
                style: TextStyle(fontSize: 16.0, color: Colors.black87),
              ),
              SizedBox(height: 16.0),

              // Additional Course Information
              Text(
                'The course near you in Dudley run by Jane & Julie is starting on Wednesday Mar 20, 7:00 PM and will run online on Zoom at the same day and time each week for 2 hours.\n\nJoin the course here:',
                style: TextStyle(fontSize: 16.0, color: Colors.black87),
              ),

              // Clickable Course Link
              InkWell(
                onTap: () {}, // TODO: Implement navigation to course link
                child: Text(
                  'https://actionforhappiness.org/course/happiness-habits-dudley',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 16.0),

              // File Attachment Section (PDF Document)
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors
                          .grey), // Adds a border around the file container
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.picture_as_pdf,
                      color: darkBlue,
                      size: 40,
                    ),
                    SizedBox(width: 12.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Happiness Habits.pdf', // TODO: Replace with dynamic file name
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'PDF Document',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Download Button
                    IconButton(
                      onPressed:
                          () {}, // TODO: Implement download functionality
                      icon: Icon(
                        Icons.download,
                        color: darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
