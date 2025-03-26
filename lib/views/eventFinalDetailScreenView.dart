import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/utilities/models/eventsModel.dart';
import 'package:graduate_plus/utilities/services/dataService.dart';
import 'package:graduate_plus/utilities/textStyles.dart';
import 'package:graduate_plus/widgets/eventsGridViewCardWidget.dart';
import 'package:graduate_plus/widgets/gridViewCardWidget.dart';

class EventsFinalDetailScreenView extends StatelessWidget {
  final EventsModel event;
  const EventsFinalDetailScreenView({super.key, required this.event});
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
              event.title,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
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
                      event.publisherName,
                      style: textStyleBold(blackColor),
                    ),
                  ],
                ),
                // Interaction Buttons (Like, Save, Download, Share)
                Row(
                  children: [
                    Icon(CupertinoIcons.heart, size: 22.0, color: darkBlue),
                    SizedBox(width: 4.0),
                    Text(event.like.toString()),
                    SizedBox(width: 16.0),
                    Icon(CupertinoIcons.bookmark, size: 18.0, color: darkBlue),
                    SizedBox(width: 16.0),
                    Icon(CupertinoIcons.arrow_down_to_line,
                        size: 20.0, color: Colors.black),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Event Description
            Text(
              event.description.join("\n"),
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
