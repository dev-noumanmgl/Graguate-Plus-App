import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/widgets/gridViewCardWidget.dart';

class MessagesScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size; // Get screen size for responsiveness

    return DefaultTabController(
      length: 3, // Defines the number of tabs
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(CupertinoIcons.back,
                color: whiteColor), // Back button icon
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Navigate back to the previous screen
            },
          ),
          backgroundColor: darkBlue, // App bar background color
          foregroundColor: whiteColor, // Icon and text color
          titleSpacing: 0, // Aligns title closer to the leading icon
          title: Text('Messages'), // App bar title
          actions: [
            IconButton(
              icon: Icon(Icons.search), // Search icon button
              onPressed: () {}, // Define search action
            ),
          ],
        ),
        body: Column(
          children: [
            // Tab Bar Section
            Container(
              decoration: BoxDecoration(
                  color: darkBlue, // Tab bar background color
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(22),
                      bottomRight:
                          Radius.circular(22))), // Rounded bottom corners
              child: TabBar(
                indicatorColor: whiteColor, // Active tab indicator color
                labelColor: whiteColor, // Active tab text color
                unselectedLabelColor:
                    whiteColor.withOpacity(.7), // Inactive tab text color
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Read'),
                  Tab(text: 'Unread'),
                ],
              ),
            ),

            // Tab Bar View Section
            Expanded(
              child: TabBarView(
                children: [
                  readMessagesBodySection(), // Displays content for "All" tab
                  readMessagesBodySection(), // Displays content for "Read" tab
                  readMessagesBodySection(), // Displays content for "Unread" tab
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget that returns the body for each tab
  Widget readMessagesBodySection() {
    return Center(
        child: Text("No messages")); // Placeholder text for empty messages
  }
}
