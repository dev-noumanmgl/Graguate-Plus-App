import 'package:flutter/cupertino.dart';
import 'package:graduate_plus/utilities/appColors.dart';

// GridViewCardWidget: A customizable card widget for displaying posts with image, title, likes, and other details.
class GridViewCardWidget extends StatefulWidget {
  final String imagePath,
      postedDate,
      postedBy; // Path for the image, date posted, and name of the poster
  final String title; // Title of the post
  final int likes; // Number of likes
  final bool hasLogo; // Flag to show or hide the logo

  GridViewCardWidget({
    required this.imagePath,
    required this.postedDate,
    required this.postedBy,
    required this.title,
    required this.likes,
    this.hasLogo = false, // Default value is false if not provided
  });

  @override
  State<GridViewCardWidget> createState() => _GridViewCardWidgetState();
}

class _GridViewCardWidgetState extends State<GridViewCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(8.0), // Rounded corners for the card
        border:
            Border.all(color: greyColor.withOpacity(0.3)), // Light grey border
      ),
      child: Stack(
        clipBehavior:
            Clip.none, // Allows positioning elements outside the card boundary
        children: [
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align children to the start (left)
            children: [
              // Top image section
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0)), // Rounded top corners
                child: Image.asset(
                  widget.imagePath, // Image source path
                  height: 120.0, // Image height
                  width: double.infinity, // Full width of the container
                  fit: BoxFit.cover, // Cover the entire area
                ),
              ),

              // Content section with padding
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10), // Space between image and title

                    // Title of the post
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                      maxLines: 2, // Maximum of 2 lines for the title
                      overflow:
                          TextOverflow.ellipsis, // Ellipsis for long titles
                    ),

                    SizedBox(height: 8.0), // Spacing below the title

                    // Display 'Posted by' row only if postedBy is not empty
                    widget.postedBy.isNotEmpty
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // Spread out elements
                            children: [
                              Text("Posted by:",
                                  style: TextStyle(fontSize: 10)), // Label text
                              Text(widget.postedBy,
                                  style: TextStyle(
                                      fontSize: 12)), // Name of the poster
                            ],
                          )
                        : SizedBox(),

                    widget.postedBy.isNotEmpty
                        ? SizedBox(height: 4.0)
                        : SizedBox(), // Conditional spacing

                    // Display posted date if it's provided
                    widget.postedDate.isNotEmpty
                        ? Align(
                            alignment: Alignment
                                .bottomRight, // Align date to the right
                            child: Text(
                              widget.postedDate,
                              style: TextStyle(fontSize: 12),
                            ),
                          )
                        : SizedBox(),

                    widget.postedDate.isNotEmpty
                        ? SizedBox(height: 4.0)
                        : SizedBox(), // Conditional spacing

                    // Display likes only when postedBy is empty
                    widget.postedBy.isEmpty
                        ? Row(
                            mainAxisAlignment:
                                MainAxisAlignment.end, // Align to the right
                            children: [
                              widget.likes != 0
                                  ? Row(
                                      children: [
                                        Icon(CupertinoIcons.heart_fill,
                                            size: 16.0,
                                            color:
                                                darkBlue), // Heart icon for likes
                                        SizedBox(width: 4.0),
                                        Text(
                                          '${widget.likes}', // Number of likes
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
          if (widget.hasLogo)
            Positioned(
              bottom: widget.postedBy.isNotEmpty
                  ? 105
                  : 75, // Adjust position based on postedBy presence
              left: 8.0,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(100), // Circular border for logo
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
                      fit: BoxFit.cover, // Cover the entire circular area
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
