import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';

/// BeyondGraduatePlusScreenView displays a screen featuring the BeyondGraduatePlus magazine editions.
/// The screen includes a transparent AppBar with a logo, a descriptive title, and a responsive grid of magazine cards.
class BeyondGraduatePlusScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with a transparent background and no shadow
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Removes AppBar background color
        elevation: 0, // Eliminates the AppBar shadow for a cleaner look

        // Back button icon (Cupertino style for iOS-like feel)
        leading: IconButton(
          icon:
              Icon(CupertinoIcons.back, color: blackColor), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),

        titleSpacing:
            0, // Removes default padding between leading icon and title

        // Row containing the BCU logo
        title: Row(
          children: [
            Image.asset(
              'assets/images/bcuLogo.png', // Path to the BCU logo image
              height: 40.0, // Sets the height of the logo
            ),
          ],
        ),
      ),

      // Body of the screen with padding for better UI spacing
      body: Padding(
        padding: const EdgeInsets.all(
            16.0), // Adds consistent padding around the body
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns children to the start (left)
          children: [
            // Header text providing information about BeyondGraduatePlus
            Text(
              "Stay in the Loop with BeyondGraduatePlus - Your Quarterly Magazine to All Things Student!",
              style: TextStyle(
                fontSize: 18, // Font size for emphasis
                fontWeight: FontWeight.bold, // Bold for highlighting the title
              ),
            ),
            SizedBox(height: 16), // Space between the title and the grid

            // Expanded widget ensures the GridView occupies available space without overflow
            Expanded(
              child: GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                // Responsive grid: shows 3 columns on wider screens (>600px) and 2 on smaller ones

                crossAxisSpacing: 16.0, // Horizontal spacing between grid items
                mainAxisSpacing: 16.0, // Vertical spacing between grid items

                // Grid items representing magazine editions
                children: [
                  _buildCard(
                      "BeyondGraduatePlus September"), // First magazine card
                  _buildCard(
                      "BeyondGraduatePlus May 20"), // Second magazine card
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a styled card widget with a given [title].
  /// The card has a dark blue background, rounded corners, and centered white text.
  Widget _buildCard(String title) {
    return Card(
      color: darkBlue, // Background color from appColors.dart
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(16.0), // Rounded corners for a modern look
      ),
      child: Center(
        // Centers the title text inside the card
        child: Text(
          title, // Title passed to the card
          textAlign: TextAlign.center, // Centers text within the card
          style: TextStyle(
            color:
                Colors.white, // White text for contrast against dark background
            fontSize: 16.0, // Readable font size
            fontWeight: FontWeight.bold, // Bold font for emphasis
          ),
        ),
      ),
    );
  }
}
