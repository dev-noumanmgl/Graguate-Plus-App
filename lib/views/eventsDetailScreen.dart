import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/utilities/textStyles.dart';
import 'package:graduate_plus/widgets/gridViewCardWidget.dart';

class EventsDetailScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          height: 40.0,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Cover Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/images/coverPic.png',
                width: double.infinity,
                height: 160.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.0),

            // Event Title
            Text(
              'Building and Construction Management',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Event Location
            Row(
              children: [
                Icon(Icons.location_on_rounded),
                SizedBox(width: 4),
                Text(
                  "Curzon Building Room C423",
                  style: textStyleBold(blackColor),
                )
              ],
            ),
            SizedBox(height: 8.0),

            // Date and Interaction Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_month),
                    SizedBox(width: 4),
                    Text(
                      "SEP 20, 2024 21:00",
                      style: textStyleBold(blackColor),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Event Description
            Text(
              "Graduate+ Week is a fantastic opportunity for you to develop as more well-rounded students. Across the week, across both campuses and online, explore an exciting range of activities that will expand your horizons, develop your skills, and complete your student experience!",
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0),
            Text(
              "If you haven’t come across the programme, this is an ideal opportunity to engage with BCU’s extra and co-curricular awards. Academics, across all courses, will be encouraging you to engage with the activities we have on offer that cover the gamut of experiences such as: developing your academic skills with courses offered by the Centre for Academic Success with sessions on academic writing, critical thinking, referencing and more; improving your employability with sessions offered by the careers team that will help you to know how to talk to employers, or explore volunteering and mentoring opportunities.",
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
