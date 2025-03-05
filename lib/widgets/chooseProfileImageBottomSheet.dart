import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/utilities/textStyles.dart';

/// This widget displays a bottom sheet to allow the user to choose an image
/// source (either from the camera or the gallery).
Widget chooseProfileImagesBottomSheet(context) {
  return Container(
    padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8, top: 24),
    height: 160,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Row for the title and close button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Choose Image",
              style: textStyleH3(whiteColor), // Styled title text
            ),
            const Icon(
              Icons.cancel, // Close icon (not functional yet)
              size: 28,
            )
          ],
        ),
        const SizedBox(height: 4),

        // Row for camera and gallery selection
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                InkWell(
                    onTap: () => Navigator.of(context).pop("camera"),
                    child: circleAvatarIconView(
                        Icons.camera_alt)), // Camera option
                const SizedBox(height: 15),
                const Text("Camera") // Label for camera option
              ],
            ),
            const SizedBox(width: 50), // Space between options
            Column(
              children: [
                InkWell(
                    onTap: () => Navigator.of(context).pop("gallery"),
                    child: circleAvatarIconView(
                        CupertinoIcons.graph_square_fill)), // Gallery option
                const SizedBox(height: 15),
                const Text("Gallery") // Label for gallery option
              ],
            ),
          ],
        )
      ],
    ),
  );
}

/// This widget creates a circular icon button with a border.
/// It is used to represent camera and gallery options.
Widget circleAvatarIconView(IconData icon) {
  return Container(
    decoration: BoxDecoration(
        borderRadius:
            const BorderRadius.all(Radius.circular(24)), // Rounded corners
        border: Border.all(
            color: Colors.black.withOpacity(.6))), // Semi-transparent border
    child: CircleAvatar(
      backgroundColor: whiteColor, // Background color of the button
      child: Icon(icon,
          color: Colors.black.withOpacity(.6)), // Icon color with transparency
    ),
  );
}
