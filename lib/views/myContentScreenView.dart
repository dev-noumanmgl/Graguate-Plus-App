import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/views/courseDetailsScreenView.dart';
import 'package:graduate_plus/views/graduateEventDetailScreenView.dart';
import 'package:graduate_plus/widgets/gridViewCardWidget.dart';

/// MyContentScreenView displays a screen with three tabs:
/// "Recently Viewed," "Saved," and "Assessments," each showing a grid of content cards.
class MyContentScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; // Retrieves the screen size for responsive layout

    return DefaultTabController(
      length: 3, // Defines three tabs for the interface
      child: Scaffold(
        // App Bar Section
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(CupertinoIcons.back,
                color: whiteColor), // Back button icon
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Navigate back to the previous screen
            },
          ),
          backgroundColor:
              darkBlue, // Sets AppBar background color from appColors.dart
          foregroundColor: whiteColor, // Sets icons and text color to white
          titleSpacing:
              0, // Removes extra padding between leading icon and title
          title: Text('My Content'), // AppBar title

          // Search icon button on the right side of AppBar
          actions: [
            IconButton(
              icon: Icon(Icons.search), // Search icon
              onPressed: () {
                // TODO: Add search functionality
              },
            ),
          ],
        ),

        // Body Section with TabBar and TabBarView
        body: Column(
          children: [
            // Tab Bar with three tabs
            Container(
              color:
                  darkBlue, // Background color matching AppBar for consistency
              child: TabBar(
                indicatorColor: whiteColor, // Underline indicator color
                labelColor: whiteColor, // Color for selected tab text
                unselectedLabelColor: whiteColor
                    .withOpacity(.7), // Faded color for unselected tabs
                tabs: [
                  Tab(text: 'Recently Viewed'), // First tab
                  Tab(text: 'Saved'), // Second tab
                  Tab(text: 'Assessments'), // Third tab
                ],
              ),
            ),

            // Displays content corresponding to each tab
            Expanded(
              child: TabBarView(
                children: [
                  ContentListView(size: size), // Content for "Recently Viewed"
                  ContentListView(size: size), // Content for "Saved"
                  ContentListView(size: size), // Content for "Assessments"
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ContentListView displays a scrollable grid of content cards.
class ContentListView extends StatelessWidget {
  final Size size; // Size parameter for responsive design

  const ContentListView({required this.size});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Enables vertical scrolling for the entire grid
      child: Padding(
        padding:
            const EdgeInsets.all(16.0), // Padding around the grid for spacing
        child: GridView.builder(
          shrinkWrap: true, // Ensures GridView takes only the needed space
          physics:
              NeverScrollableScrollPhysics(), // Disables GridView’s own scrolling to avoid conflict with SingleChildScrollView

          // Grid layout configuration
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 16.0, // Horizontal space between items
            mainAxisSpacing: 16.0, // Vertical space between items
            childAspectRatio: 0.8, // Controls item height-to-width ratio
          ),

          itemCount: 6, // Number of items to display in the grid
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Graduateeventdetailscreenview(),
                    ));
              },
              child: GridViewCardWidget(
                postedBy:
                    "", // Placeholder: Replace with actual data when available
                postedDate: "", // Placeholder: Replace with actual date
                imagePath:
                    'assets/images/bcuFB.png', // Image displayed in the card
                title: index % 2 == 0
                    ? 'Question sets and reports for students' // Alternate titles based on index
                    : 'Give feedback - it only takes 2 minutes',
                likes: 213, // Hardcoded likes for demonstration
                hasLogo: true, // Determines whether to show a logo on the card
              ),
            );
          },
        ),
      ),
    );
  }
}
