import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/views/eventsDetailScreen.dart';
import 'package:graduate_plus/widgets/filterEventsBottomSheetWidget.dart';

/// EventsScreenView displays a list of ongoing events with details
/// like title, date, location, and an indicator for online events.
class EventsScreenView extends StatelessWidget {
  // Sample list of events with details
  final List<Event> events = [
    Event(
      title: "Wellbeing Session",
      date: "SEP 20, 2024 21:00",
      location: "Curzon Building Room C423",
      isOnline: false,
    ),
    Event(
      title: "Wellbeing Session",
      date: "SEP 20, 2024 21:00",
      location: "Online",
      isOnline: true,
    ),
    Event(
      title: "Wellbeing Session",
      date: "SEP 20, 2024 21:00",
      location: "Curzon Building C423",
      isOnline: false,
    ),
    Event(
      title: "Wellbeing Session",
      date: "SEP 20, 2024 21:00",
      location: "Online",
      isOnline: true,
    ),
    Event(
      title: "Wellbeing Session",
      date: "SEP 20, 2024 21:00",
      location: "Curzon Building Room C423",
      isOnline: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with back button, search, and filter icons
      appBar: AppBar(
        leading: IconButton(
          icon:
              Icon(CupertinoIcons.back, color: whiteColor), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        backgroundColor:
            darkBlue, // AppBar background color from appColors.dart
        foregroundColor: whiteColor, // Foreground color (icons & text)
        titleSpacing: 0, // Removes extra padding before the title
        title: Text('My Content'), // AppBar title

        // AppBar action icons
        actions: [
          IconButton(
            icon: Icon(Icons.search), // Search icon
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_alt_rounded), // Filter icon
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                ),
                context: context,
                builder: (context) {
                  return filterEventsBottomSheet(context);
                },
              );
            },
          ),
        ],
      ),

      // Body of the screen
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 16.0), // Horizontal padding for content
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align content to the left
          children: [
            SizedBox(height: 16.0), // Spacing after AppBar

            // Header image with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/graduatePlusHeader.png', // Header image asset
                width: double.infinity, // Full width of the screen
                fit: BoxFit.cover, // Cover the entire container area
              ),
            ),
            SizedBox(height: 16.0), // Spacing after the image

            // Section title for events
            Text(
              'Ongoing',
              style: TextStyle(
                fontSize: 24.0, // Large font size for heading
                fontWeight: FontWeight.bold, // Bold text
                color: Colors.black, // Black text color
              ),
            ),
            SizedBox(height: 16.0), // Spacing before the event list

            // List of events displayed vertically
            Expanded(
              child: ListView.builder(
                itemCount: events.length, // Number of event items
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventsDetailScreenView(),
                          ));
                    },
                    child: EventCard(event: events[index]),
                  ); // Each event displayed using EventCard
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Event model class to hold event information.
class Event {
  final String title; // Title of the event
  final String date; // Event date and time
  final String location; // Event location
  final bool isOnline; // Indicator if the event is online

  Event({
    required this.title,
    required this.date,
    required this.location,
    required this.isOnline,
  });
}

/// EventCard widget displays individual event details inside a card layout.
class EventCard extends StatelessWidget {
  final Event event; // Event data to display

  const EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 8.0), // Space between event cards
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded card corners
      ),
      elevation: 4.0, // Shadow effect for card depth
      child: Padding(
        padding: EdgeInsets.all(8.0), // Padding inside the card
        child: Row(
          children: [
            // Event image placeholder with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/bcuFB.png', // Event image asset
                width: 60.0, // Image width
                height: 60.0, // Image height
                fit: BoxFit.cover, // Cover the entire image box
              ),
            ),
            SizedBox(width: 16.0), // Space between image and event details

            // Event details section
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: [
                  // Event title
                  Text(
                    event.title,
                    style: TextStyle(
                      fontSize: 16.0, // Medium font size
                      fontWeight: FontWeight.bold, // Bold title
                      color: Colors.black, // Black text color
                    ),
                  ),
                  SizedBox(height: 8.0), // Spacing between title and date

                  // Event date with calendar icon
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month, // Calendar icon
                        size: 16.0, // Small icon size
                        color: Colors.black54, // Grey icon color
                      ),
                      SizedBox(width: 4.0), // Space between icon and date text
                      Text(
                        event.date, // Display event date
                        style: TextStyle(
                          fontSize: 14.0, // Small font size
                          color: Colors.black54, // Grey text color
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0), // Spacing between date and location

                  // Event location with location icon
                  Row(
                    children: [
                      Icon(
                        Icons.location_on, // Location pin icon
                        size: 16.0, // Small icon size
                        color: Colors.black54, // Grey icon color
                      ),
                      SizedBox(
                          width: 4.0), // Space between icon and location text
                      Text(
                        event.isOnline
                            ? 'Online'
                            : event
                                .location, // Show 'Online' if event is online, otherwise location
                        style: TextStyle(
                          fontSize: 14.0, // Small font size
                          color: Colors.black54, // Grey text color
                        ),
                        maxLines: 1, // Restrict text to one line
                        overflow: TextOverflow
                            .ellipsis, // Show ellipsis if text overflows
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Logo or more options icon on the right
            ClipRRect(
              borderRadius: BorderRadius.circular(
                  100), // Fully rounded for circular shape
              child: Container(
                height: 40.0, // Icon container height
                width: 40.0, // Icon container width
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Circular shape
                  color: whiteColor, // White background color
                  border: Border.all(
                      color: blackColor), // Black border around the circle
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/bcuLogo1.png", // Logo image asset
                    fit: BoxFit.cover, // Cover the entire container
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
