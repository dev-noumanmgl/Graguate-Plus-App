import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/utilities/textStyles.dart';

class MockUpDetailsScreenView extends StatelessWidget {
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
        title: Row(
          children: [
            Image.asset(
              'assets/images/bcuLogo.png', // Logo image in the app bar
              height: 40.0,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.mic, color: Colors.black),
            onPressed: () {}, // Microphone action button
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Title
            Text(
              'Assessment Centre',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
            ),
            SizedBox(height: 8.0),

            // Profile Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Profile Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(color: blackColor)),
                        child: Center(
                            child: Image.asset(
                          "assets/images/bcuLogo1.png",
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "BCU",
                      style: textStyleBold(blackColor),
                    )
                  ],
                ),

                // Icons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.heart,
                        size: 22.0, color: blackColor), // Like button
                    SizedBox(width: 16.0),
                    Icon(CupertinoIcons.arrow_down_to_line,
                        size: 20.0, color: blackColor), // Download button
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Description Section
            Text(
              "Students often assume that you can't prepare for assessment centres but there are different ways you can prepare...",
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 8.0),

            // Task List
            Text(
              "- Complete 1 Assessment Centre Exercise on Graduates First...\n- Book a Careers Plus appointment...\n- Watch 6 videos on Assessment centres...",
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            SizedBox(height: 16.0),

            // Links Section
            Text(
              'Direct links to the above videos:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),

            // Generating a list of links dynamically
            ...List.generate(
              10,
              (index) => InkWell(
                onTap: () {}, // Link action
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '• Link $index: Description of the link',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14.0,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Image Section
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/images/bcuAssesment Centre.png',
                width: screenWidth,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),

            // Reflect Section
            Text(
              'Reflect on your experience of learning about assessment centres and completing activities',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),

            // Word Count
            Text(
              '0 / 200 words',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8.0),

            // Text Input Box
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Type here...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
