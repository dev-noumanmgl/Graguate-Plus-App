import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';

class BadgeDetailScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // AppBar with a back button and share option
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
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.share, color: Colors.black),
            onPressed: () {
              // Handle share action
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/backgroundPic.png'), // Replace with actual background image
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Centered Card
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8.0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Share button inside the card
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.share),
                    ),
                  ),

                  // University Logo
                  Image.asset(
                    'assets/images/bcuLogo.png', // Replace with actual university logo
                    height: 60.0,
                  ),
                  SizedBox(height: 16.0),

                  // User Name and Date
                  Text(
                    'Pardeep Singh',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'SEP 20, 2024',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16.0),

                  // Badge Image
                  Image.asset(
                    'assets/images/bcuBronzeAward.png', // Replace with actual badge image
                    height: 150.0,
                  ),
                  SizedBox(height: 16.0),

                  // Badge Title
                  Text(
                    'Bronze Award - BCU Graduate+',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 8.0),

                  // Badge Description
                  Text(
                    'Graduate Plus Bronze Award for engaging in Extracurricular Activities',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
