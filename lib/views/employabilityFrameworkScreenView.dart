import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/views/mockUpDetailsScreenView.dart';
import 'package:graduate_plus/widgets/gridViewCardWidget.dart';

/// EmployabilityFrameworkScreenView displays a mock-up screen of the Employability Framework.
/// It includes an AppBar with a back button and logo, a title, and a grid of activity cards.
class EmployabilityFrameworkScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with transparent background and no shadow
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Makes AppBar background transparent
        elevation: 0, // Removes the shadow under the AppBar

        // Back button icon (using Cupertino style)
        leading: IconButton(
          icon:
              Icon(CupertinoIcons.back, color: blackColor), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),

        titleSpacing: 0, // Removes default padding around the title

        // Displays the BCU logo in the AppBar
        title: Image.asset(
          'assets/images/bcuLogo.png',
          height: 40.0, // Logo height
        ),
      ),

      // Body wrapped in a scrollable view to prevent overflow
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0), // Adds padding around the content
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns children to the start (left)
          children: [
            // Title Text
            Text(
              'Mock-up of what the EF in Grad+ looks like',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0), // Spacing between the title and grid

            // Grid displaying award activity cards
            GridView.builder(
              shrinkWrap: true, // Ensures the grid takes only necessary space
              physics:
                  NeverScrollableScrollPhysics(), // Prevents the grid from scrolling (handled by SingleChildScrollView)
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two items per row
                crossAxisSpacing: 16.0, // Horizontal spacing between items
                mainAxisSpacing: 16.0, // Vertical spacing between items
                childAspectRatio:
                    0.8, // Adjusts height-to-width ratio of grid items
              ),
              itemCount: 7, // Number of cards displayed in the grid
              itemBuilder: (context, index) {
                // Builds each grid item using a custom widget
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MockUpDetailsScreenView(),
                        ));
                  },
                  child: GridViewCardWidget(
                    postedBy: "", // Placeholder for the posted by info
                    postedDate: "", // Placeholder for the posted date
                    imagePath: 'assets/images/bcuFB.png', // Image for the card
                    title: index % 2 == 0
                        ? 'Question sets and reports for students' // Title for even indices
                        : 'Give feedback - it only takes 2 minutes', // Title for odd indices
                    likes: 213, // Static like count
                    hasLogo:
                        true, // Indicates whether the logo is displayed on the card
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Helper function to build an award card (currently unused but useful for reference)
  /// [title]: Title text displayed on the card.
  /// [likes]: Number of likes for the card.
  /// [imagePath]: Path to the image displayed on the card.
  Widget _buildAwardCard(String title, int likes, String imagePath) {
    return Card(
      elevation: 4.0, // Card shadow depth
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(12.0), // Rounded corners for the card
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Aligns content to the start
        children: [
          // Top image with rounded top corners
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.asset(
              imagePath, // Image path
              height: 100.0, // Image height
              width: double.infinity, // Image stretches to card width
              fit: BoxFit.cover, // Ensures the image covers the entire area
            ),
          ),

          // Content section below the image
          Padding(
            padding: EdgeInsets.all(8.0), // Padding around text and icons
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title text with ellipsis overflow handling
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 2, // Limits title to two lines
                  overflow: TextOverflow.ellipsis, // Truncates text with "..."
                ),
                SizedBox(
                    height: 8.0), // Spacing between title and likes section

                // Likes section with thumbs-up icon
                Row(
                  children: [
                    Icon(Icons.thumb_up,
                        size: 16.0, color: Colors.grey), // Like icon
                    SizedBox(width: 4.0), // Spacing between icon and like count
                    Text(
                      likes.toString(), // Displays the number of likes
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
