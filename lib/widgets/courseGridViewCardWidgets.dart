import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/utilities/models/courseModel.dart';
import 'package:graduate_plus/utilities/services/dataService.dart';
import 'package:graduate_plus/views/courseDetailsScreenView.dart';
import 'package:graduate_plus/views/courseFeedbackDetailScreenView.dart';

class GridViewCardWidgets extends StatelessWidget {
  final bool hasLogo;
  final String postedBy;
  final String postedDate;
  final String nextScreen;
  final Future<List<CoursesModel>> futureCourses;
  const GridViewCardWidgets(
      {super.key,
      required this.hasLogo,
      required this.postedBy,
      required this.postedDate,
      required this.nextScreen,
      required this.futureCourses});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CoursesModel>>(
      future: futureCourses,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No courses available"));
        }

        List<CoursesModel> courses = snapshot.data!;
        return GridView.builder(
          shrinkWrap:
              true, // Prevents infinite height issue in scrollable column
          physics:
              NeverScrollableScrollPhysics(), // Disables grid’s independent scrolling (handled by parent scroll view)
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 16.0, // Horizontal spacing between cards
            mainAxisSpacing: 16.0, // Vertical spacing between cards
            childAspectRatio: 0.8, // Controls the aspect ratio of each card
          ),
          itemCount: courses.length, // Number of cards displayed in the grid
          itemBuilder: (context, index) {
            final course = courses[index];
            return GestureDetector(
              onTap: () {
                nextScreen == 'course'
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Coursedetailsscreenview(
                            courses: courses[index],
                          ),
                        ))
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Coursefeedbackdetailscreenview(
                            courses: courses[index],
                          ),
                        ));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      8.0), // Rounded corners for the card
                  border: Border.all(
                      color: greyColor.withOpacity(0.3)), // Light grey border
                ),
                child: Stack(
                  clipBehavior: Clip
                      .none, // Allows positioning elements outside the card boundary
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align children to the start (left)
                      children: [
                        // Top image section
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(8.0)), // Rounded top corners
                          child: CachedNetworkImage(
                            imageUrl: course.image,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CupertinoActivityIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),

                        // Content section with padding
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 10), // Space between image and title

                              // Title of the post
                              Container(
                                height: 42,
                                child: Text(
                                  course.title,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: blackColor,
                                  ),
                                  maxLines:
                                      2, // Maximum of 2 lines for the title
                                  overflow: TextOverflow
                                      .ellipsis, // Ellipsis for long titles
                                ),
                              ),

                              SizedBox(height: 8.0), // Spacing below the title

                              // Display 'Posted by' row only if postedBy is not empty
                              postedBy.isNotEmpty
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween, // Spread out elements
                                      children: [
                                        Text("Posted by:",
                                            style: TextStyle(
                                                fontSize: 10)), // Label text
                                        Text(postedBy,
                                            style: TextStyle(
                                                fontSize:
                                                    12)), // Name of the poster
                                      ],
                                    )
                                  : SizedBox(),

                              postedBy.isNotEmpty
                                  ? SizedBox(height: 4.0)
                                  : SizedBox(), // Conditional spacing

                              // Display posted date if it's provided
                              postedDate.isNotEmpty
                                  ? Align(
                                      alignment: Alignment
                                          .bottomRight, // Align date to the right
                                      child: Text(
                                        postedDate,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    )
                                  : SizedBox(),

                              postedDate.isNotEmpty
                                  ? SizedBox(height: 4.0)
                                  : SizedBox(), // Conditional spacing

                              // Display likes only when postedBy is empty
                              postedBy.isEmpty
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .end, // Align to the right
                                      children: [
                                        course.like != 0
                                            ? Row(
                                                children: [
                                                  Icon(CupertinoIcons.heart,
                                                      size: 16.0,
                                                      color:
                                                          blackColor), // Heart icon for likes
                                                  SizedBox(width: 4.0),
                                                  Text(
                                                    '${course.like}', // Number of likes
                                                    style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: blackColor),
                                                  ),
                                                ],
                                              )
                                            : SizedBox(), // Hide if likes are zero
                                      ],
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // Display logo at a dynamic position if hasLogo is true
                    if (hasLogo)
                      Positioned(
                        bottom: postedBy.isNotEmpty
                            ? 105
                            : 75, // Adjust position based on postedBy presence
                        left: 8.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              100), // Circular border for logo
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: whiteColor,
                                border: Border.all(
                                    color:
                                        blackColor)), // White background with black border
                            child: Center(
                              child: Image.asset(
                                "assets/images/bcuLogo1.png", // Logo image
                                fit: BoxFit
                                    .cover, // Cover the entire circular area
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
