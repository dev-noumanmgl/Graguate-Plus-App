import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/utilities/textStyles.dart';
import 'package:graduate_plus/views/graduateEventDetailScreenView.dart';
import 'package:graduate_plus/widgets/gridViewCardWidget.dart';

class GraduateWeekEventDetailScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context)
        .size
        .width; // Get screen width for responsiveness

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Removes shadow under AppBar
        leading: IconButton(
          icon:
              Icon(CupertinoIcons.back, color: blackColor), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        titleSpacing: 0,
        title: Image.asset(
          'assets/images/bcuLogo.png',
          height: 40.0, // Logo size in the app bar
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Title
            Text(
              'Building and Construction Management',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),

            // Event Completion Status
            Text(
              '✓ Completed 05/11/2024',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.green, // Green color for completed status
              ),
            ),
            SizedBox(height: 8.0),

            // University & Interaction Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // University Logo and Name
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100), // Circular logo
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: whiteColor,
                          border: Border.all(color: blackColor),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/bcuLogo1.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Jisc",
                      style: textStyleBold(blackColor),
                    ),
                  ],
                ),
                // Interaction Buttons (Like, Save, Download, Share)
                Row(
                  children: [
                    Icon(CupertinoIcons.heart_fill,
                        size: 22.0, color: darkBlue),
                    SizedBox(width: 4.0),
                    Text('592'),
                    SizedBox(width: 16.0),
                    Icon(CupertinoIcons.bookmark, size: 18.0, color: darkBlue),
                    SizedBox(width: 16.0),
                    Icon(CupertinoIcons.arrow_down_to_line,
                        size: 20.0, color: Colors.black),
                    SizedBox(width: 16.0),
                    Icon(CupertinoIcons.share, size: 20.0, color: Colors.black),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Event Description
            Text(
              "Graduate+ Week is a fantastic opportunity for you to develop as more well-rounded students...",
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0),
            Text(
              "If you haven’t come across the programme, this is an ideal opportunity to engage with BCU’s extra and co-curricular awards...",
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0),

            // Activities Organized by Days
            ..._buildDaySections(),
          ],
        ),
      ),
    );
  }

  // Function to build sections for each weekday
  List<Widget> _buildDaySections() {
    final days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

    return days
        .map((day) => Column(
              children: [
                SizedBox(height: 16.0),
                // Day Title
                Text(
                  day,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
                SizedBox(height: 8.0),
                // GridView displaying event cards
                GridView.builder(
                  shrinkWrap:
                      true, // Ensures the GridView does not take infinite height
                  physics:
                      NeverScrollableScrollPhysics(), // Prevents GridView from scrolling separately
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns in the grid
                    crossAxisSpacing: 16.0, // Horizontal space between items
                    mainAxisSpacing: 16.0, // Vertical space between items
                    childAspectRatio: 0.8, // Aspect ratio of the grid items
                  ),
                  itemCount: 2, // Number of items per day
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Graduateeventdetailscreenview(),
                            ));
                      },
                      child: GridViewCardWidget(
                        postedBy: "", // TODO: Add dynamic data
                        postedDate: "", // TODO: Add dynamic data
                        imagePath:
                            'assets/images/bcuFB.png', // Placeholder image
                        title: index % 2 == 0
                            ? 'Question sets and reports for students'
                            : 'Give feedback - it only takes 2 minutes',
                        likes: 213,
                        hasLogo: true,
                      ),
                    );
                  },
                ),
              ],
            ))
        .toList();
  }
}
