import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/views/graduateEventDetailScreenView.dart';
import 'package:graduate_plus/widgets/gridViewCardWidget.dart';

/// A stateless widget that displays the Academic Success screen view.
class AcademicSuccessScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with transparent background and back button
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
            // University logo in the AppBar
            Image.asset(
              'assets/images/bcuLogo.png',
              height: 40.0,
            ),
          ],
        ),
      ),

      // Body wrapped in SingleChildScrollView to make the content scrollable
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main banner image with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                'assets/images/bcuCAS.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),

            // Description text about the Centre for Academic Success
            Text(
              "The Centre for Academic Success is the University's central learning development service. Our aim is to help you develop all of the necessary academic, technical and numerical skills you need to progress and successfully complete your course.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16),

            // Section heading for services offered
            Text(
              "We can help with:",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),

            // List of academic support services provided
            Text(
              "• Academic essay and report writing\n"
              "• English language for international students\n"
              "• Referencing\n"
              "• Dissertations\n"
              "• Improving your assignment drafts\n"
              "• Presentation skills\n"
              "• Maths and statistics\n"
              "• Computing and programming\n"
              "• Project management\n"
              "• Study skills",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16),

            // Section prompting users to explore more
            Text(
              "Find out more...",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),

            // Grid view displaying cards with resources and feedback options
            GridView.builder(
              shrinkWrap: true, // Ensures the grid doesn't take infinite height
              physics:
                  NeverScrollableScrollPhysics(), // Prevents nested scrolling
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two columns
                crossAxisSpacing: 16.0, // Horizontal spacing between cards
                mainAxisSpacing: 16.0, // Vertical spacing between cards
                childAspectRatio: 0.8, // Controls card height relative to width
              ),
              itemCount: 3, // Number of grid items
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Graduateeventdetailscreenview(),
                        ));
                  },
                  child: GridViewCardWidget(
                    postedBy: "",
                    postedDate: "",
                    imagePath: 'assets/images/bcuFB.png',
                    title: index % 2 == 0
                        ? 'Question sets and reports for students'
                        : 'Give feedback - it only takes 2 minutes',
                    likes: 0,
                    hasLogo: false,
                  ),
                );
              },
            ),
            SizedBox(height: 16),

            // Highlight card promoting the BCU Success Survey
            _buildHighlightCard(
              "BCU Success Survey",
              "This tool has been designed to help you explore your confidence and previous experiences in key areas that will feed into a positive and fulfilling university journey.",
              "Take the success survey",
              "assets/images/bcuSS.png",
            ),
            SizedBox(height: 16),

            // Highlight card promoting the Success Course Online
            _buildHighlightCard(
              "Success Course Online",
              "The Success course has been created to help you develop your academic skills. Whether you are doing your first degree, or your Master's or PhD, we are here to provide support and information to help you achieve your full potential at Birmingham City University.",
              "Sign Up for the Success Course",
              "assets/images/bcuSCO.png",
            ),
            SizedBox(height: 16),

            // Footer section with grid cards providing more student resources
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.8,
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return GridViewCardWidget(
                  postedBy: "",
                  postedDate: "",
                  imagePath: 'assets/images/bcuFB.png',
                  title: index % 2 == 0
                      ? 'Question sets and reports for students'
                      : 'Give feedback - it only takes 2 minutes',
                  likes: 213,
                  hasLogo: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a reusable card with an image and title.
  Widget _buildCard(String title, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Card image
          Image.asset(
            imagePath,
            height: 60,
          ),
          SizedBox(height: 8),

          // Card title
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }

  /// Builds a highlighted card with a description, image, and action text.
  Widget _buildHighlightCard(
      String title, String description, String actionText, String imagePath) {
    return Card(
      color: mahroonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Text content section
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card title
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),

                  // Card description
                  Text(
                    description,
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),

            // Image and action text section
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  height: 100,
                  width: 100,
                  child: Stack(
                    children: [
                      // Background image
                      Positioned.fill(
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Semi-transparent overlay for emphasis
                      Center(
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: whiteColor.withOpacity(.6),
                          ),
                        ),
                      ),

                      // Action text centered over the image
                      Center(
                        child: Container(
                          height: 80,
                          width: 80,
                          padding: EdgeInsets.all(8),
                          child: Text(
                            actionText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a footer card displaying the title, number of likes, and an image.
  Widget _buildFooterCard(String title, String likes, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Image icon on the left
            Image.asset(
              imagePath,
              height: 40,
            ),
            SizedBox(width: 16),

            // Title and likes section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title of the card
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),

                  // Likes count
                  Text("$likes Likes"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
