// Import necessary Flutter packages for UI components
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/cupertino.dart'; // Provides iOS-style widgets
import 'package:flutter/material.dart'; // Core Flutter UI components
import 'package:flutter/rendering.dart';

// Import custom utilities for colors, text styles, and widgets
import 'package:graduate_plus/utilities/appColors.dart'; // Contains predefined color values
import 'package:graduate_plus/utilities/models/courseModel.dart';
import 'package:graduate_plus/utilities/services/dataService.dart';
import 'package:graduate_plus/utilities/textStyles.dart'; // Contains predefined text styles
import 'package:graduate_plus/views/courseFeedbackDetailScreenView.dart';
import 'package:graduate_plus/widgets/gridViewCardWidget.dart';
import 'package:graduate_plus/widgets/courseGridViewCardWidgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart'; // Custom widget for displaying grid items

// Main screen for the RBS Discovery Tool, which presents a categorized list of digital resources
class Coursedetailsscreenview extends StatefulWidget {
  final CoursesModel courses;
  const Coursedetailsscreenview({super.key, required this.courses});

  @override
  State<Coursedetailsscreenview> createState() =>
      _CoursedetailsscreenviewState();
}

class _CoursedetailsscreenviewState extends State<Coursedetailsscreenview> {
  final GlobalKey _globalKey = GlobalKey();

  Future<void> _captureAndSavePdf(
      GlobalKey globalKey, BuildContext context) async {
    try {
      // Request MANAGE_EXTERNAL_STORAGE permission for Android 11+
      if (Platform.isAndroid) {
        var status = await Permission.manageExternalStorage.request();
        if (!status.isGranted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    "Storage permission denied. Please allow it in settings.")),
          );
          return;
        }
      }

      // Convert Widget to Image
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Create PDF document
      final pdf = pw.Document();
      final pdfImage = pw.MemoryImage(pngBytes);

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Center(child: pw.Image(pdfImage));
          },
        ),
      );

      // Get Root Storage Path
      String directoryPath = await _getRootStoragePath();
      String filePath = "$directoryPath/MyScreenCapture.pdf";
      File file = File(filePath);

      // Save the PDF file
      await file.writeAsBytes(await pdf.save());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("PDF saved at: $filePath")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

// Function to get the Root Storage Path
  Future<String> _getRootStoragePath() async {
    if (Platform.isAndroid) {
      String path = await ExternalPath.getExternalStoragePublicDirectory(
          ExternalPath.DIRECTORY_DOWNLOAD);
      return path.replaceAll("Download", ""); // Gets `/storage/emulated/0/`
    }
    final directory = await getApplicationDocumentsDirectory();
    return directory.path; // iOS fallback
  }

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size; // Get screen size for responsive layout

    return Scaffold(
      // App Bar with a back button and a logo
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Transparent to blend with the design
        elevation: 0, // Remove shadow for a cleaner look
        leading: IconButton(
          icon:
              Icon(CupertinoIcons.back, color: blackColor), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        titleSpacing: 0, // Align title with the leading icon
        title: Image.asset(
          'assets/images/bcuLogo.png', // Display BCU logo
          height: 40.0,
        ),
      ),

      // Main body wrapped in a scrollable view
      body: RepaintBoundary(
        key: _globalKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0), // Add horizontal padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner Section - Displays an image at the top
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: CachedNetworkImage(
                    imageUrl: widget.courses.image,
                    height: 79,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CupertinoActivityIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(height: 16.0), // Add spacing below the banner

                // Title Section - Displays the main heading of the page
                Text(
                  widget.courses.title, // Page title
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8), // Space between title and profile section

                // Profile & Interaction Row - Shows author and interaction buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Profile Picture and Author Name
                    Row(
                      children: [
                        // Circular Profile Image
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(100), // Rounded image
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              border: Border.all(
                                  color:
                                      blackColor), // Black border around the image
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/images/bcuLogo1.png", // Profile image
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8), // Space between image and text
                        Text(
                          widget
                              .courses.publiserName, // Author/Organization name
                          style: textStyleBold(blackColor),
                        ),
                      ],
                    ),

                    // Interaction Icons (Likes, Bookmark, Download, Share)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.heart,
                            size: 22.0, color: blackColor), // Like icon
                        SizedBox(width: 4.0),
                        Text(widget.courses.like.toString()), // Like count

                        SizedBox(width: 16.0),
                        Icon(CupertinoIcons.bookmark,
                            size: 18.0, color: blackColor), // Bookmark icon

                        SizedBox(width: 16.0),
                        GestureDetector(
                          onTap: () {
                            _captureAndSavePdf(_globalKey, context);
                          },
                          child: Icon(CupertinoIcons.arrow_down_to_line,
                              size: 20.0, color: blackColor),
                        ), // Download icon

                        SizedBox(width: 16.0),
                        Icon(CupertinoIcons.share,
                            size: 20.0, color: blackColor), // Share icon
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.0), // Space below the profile section

                // Description Section - Provides an overview of the available resources
                Text(
                  widget.courses.description.join("\n\n"),
                  style: TextStyle(fontSize: 14.0, color: Colors.grey.shade600),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: Container(height: 6, color: darkBlue)),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "0%",
                      style: TextStyle(fontSize: 16.0, color: blackColor),
                    )
                  ],
                ),
                SizedBox(height: 16.0), // Space before listing sections

                GridViewCardWidgets(
                  hasLogo: true,
                  postedBy: '',
                  nextScreen: 'courseFeedback',
                  postedDate: '',
                  futureCourses: DataService.fetchCourses(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
