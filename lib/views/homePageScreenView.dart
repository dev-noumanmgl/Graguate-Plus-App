import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/utilities/services/dataService.dart';
import 'package:graduate_plus/widgets/courseGridViewCardWidgets.dart';
import 'package:graduate_plus/widgets/drawerViewWidget.dart';
import 'package:graduate_plus/widgets/eventsGridViewCardWidget.dart';
import 'package:graduate_plus/widgets/gridViewCardWidget.dart';
import 'package:video_player/video_player.dart';

// Home Page Screen with video, images, and grid views for awards and projects
class HomePageScreenView extends StatefulWidget {
  @override
  _HomePageScreenViewState createState() => _HomePageScreenViewState();
}

class _HomePageScreenViewState extends State<HomePageScreenView> {
  late VideoPlayerController
      _videoController; // Controller to manage video playback

  @override
  void initState() {
    super.initState();
    // Initialize the video controller with a local asset video
    _videoController =
        VideoPlayerController.asset('assets/videos/bcuHomeVideo.mp4')
          ..initialize().then((_) {
            setState(() {}); // Refresh UI after video initialization
          });
  }

  @override
  void dispose() {
    _videoController.dispose(); // Dispose video controller to free resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with logo, search, notifications, and menu icons
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Transparent background for modern look
        elevation: 0, // No shadow
        leading: IconButton(
          icon:
              Icon(CupertinoIcons.back, color: blackColor), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        titleSpacing: 0, // Align title/logo to the left
        title: Image.asset(
          'assets/images/bcuLogo.png', // BCU logo
          height: 40.0,
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}), // Search icon
          IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {}), // Notifications
          // Builder ensures correct context for opening the drawer
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu, color: Colors.black), // Menu icon
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Opens the drawer
                },
              );
            },
          ),
        ],
      ),

      // Navigation Drawer (Hamburger menu)
      drawer: DrawerViewWidget(context), // Custom drawer widget

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0), // Padding around the main content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/graduatePlusHeader.png', // Header image
                width: double.infinity,
                fit: BoxFit.cover, // Ensures image covers full width
              ),
            ),
            SizedBox(height: 16.0), // Spacing between widgets

            // Introductory text about Graduate+
            Text(
              'Graduate+ is an extra & co-curricular awards framework offered to all students at BCU across all faculties & courses. It is designed to help you stand out from the crowd, whilst preparing you for your future.',
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0),

            // Embedded Video Section with play/pause functionality
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(12.0), // Rounded border for video
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: _videoController.value.isInitialized
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          AspectRatio(
                            aspectRatio: _videoController.value
                                .aspectRatio, // Maintains video aspect ratio
                            child: VideoPlayer(
                                _videoController), // Video player widget
                          ),
                          // Play/Pause button overlay
                          IconButton(
                            icon: Icon(
                              _videoController.value.isPlaying
                                  ? Icons.pause_circle_filled
                                  : Icons
                                      .play_circle_filled, // Dynamic icon based on play state
                              size: 50,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                // Toggle video playback
                                _videoController.value.isPlaying
                                    ? _videoController.pause()
                                    : _videoController.play();
                              });
                            },
                          ),
                        ],
                      )
                    : Center(
                        child:
                            CircularProgressIndicator()), // Loading indicator while video initializes
              ),
            ),
            SizedBox(height: 16.0),

            // Additional descriptive text
            Text(
              'At BCU, we do things differently. When you immerse yourself in everything we have to offer, you’ll be building on your current skillset, whilst having some fun too.',
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0),

            // Explore Bronze Award Banner
            Image.asset(
              'assets/images/bcuExploreBanner.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.0),

            // Cards Section: Displays awards in a grid format
            EventsGridViewCardWidgets(
              hasLogo: true,
              postedBy: '',
              nextScreen: 'detail',
              postedDate: '',
              events: DataService.fetchGraduateEvents(),
            ),

            SizedBox(height: 16.0),

            // Other Projects Section
            Text(
              'Other Projects',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold, // Makes heading stand out
              ),
            ),
            SizedBox(height: 8.0),

            // Grid for displaying other projects
            GridViewCardWidgets(
              hasLogo: true,
              postedBy: '',
              nextScreen: 'course',
              postedDate: '',
              futureCourses: DataService.fetchCourses(),
            ),
          ],
        ),
      ),
    );
  }
}
