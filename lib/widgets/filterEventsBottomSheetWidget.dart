import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/utilities/textStyles.dart';

/// This widget displays a bottom sheet to allow the user to choose an image
/// source (either from the camera or the gallery).
Widget filterEventsBottomSheet(context) {
  return Container(
    padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8, top: 24),
    height: 200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row for the title and close button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Apply Filter",
              style: textStyleH2(blackColor), // Styled title text
            ),
            const Icon(
              Icons.cancel, // Close icon (not functional yet)
              size: 28,
            )
          ],
        ),
        const SizedBox(height: 28),
        Text(
          "Date",
          style: textStyleBold(blackColor),
        ),
        const SizedBox(height: 12),
        Text(
          "Online",
          style: textStyleBold(blackColor),
        ),
        const SizedBox(height: 12),
        Text(
          "In Person",
          style: textStyleBold(blackColor),
        ),
      ],
    ),
  );
}
