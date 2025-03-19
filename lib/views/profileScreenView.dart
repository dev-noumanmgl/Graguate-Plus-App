import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/database/userPrefs.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/views/badgeDetailScreenView.dart';
import 'package:graduate_plus/views/updateProfileScreenView.dart';
import 'package:graduate_plus/views/uploadedPostDetailsScreenView.dart';
import 'package:graduate_plus/widgets/gridViewCardWidget.dart';

class ProfileScreenView extends StatefulWidget {
  @override
  State<ProfileScreenView> createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends State<ProfileScreenView> {
  String userName = "";
  String userEmail = "";
  String userId = "";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Load user details from SharedPreferences
  Future<void> _loadUserData() async {
    String? name = await UserPrefs.getUserName();
    String? email = await UserPrefs.getUserEmail();
    String? id = await UserPrefs.getUserId();

    setState(() {
      userName = name ?? "Guest";
      userEmail = email ?? "No Email";
      userId = id ?? "Unknown";
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateProfileScreenView(),
                    ));
              }), // Search icon
        ],
        title: Row(
          children: [
            Image.asset(
              'assets/images/bcuLogo.png',
              height: 40.0,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  'assets/images/coverPic.png',
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 160.0, // Adjust to center half above the cover
                  left: size.width / 43,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          'assets/images/profile.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        userName,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 60.0),

            // Name and Bio
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'A short professional biography is a brief summary of your career accomplishments. It provides an overview of your most relevant professional experiences, qualifications, and achievements.',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.0),

            // Stats
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatCard(title: 'Skill Tags', value: '1'),
                  StatCard(title: 'Badges', value: '12'),
                  StatCard(title: 'Posts', value: '5'),
                  StatCard(title: 'Projects', value: '3'),
                ],
              ),
            ),

            SizedBox(height: 20.0),

            // // Projects Section
            // SectionHeader(title: 'Projects'),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //   child: Container(
            //     padding: const EdgeInsets.all(16.0),
            //     decoration: BoxDecoration(
            //       color: Colors.grey.shade100,
            //       borderRadius: BorderRadius.circular(8.0),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //           'You have not created any project yet.',
            //           style: TextStyle(color: Colors.grey.shade600),
            //         ),
            //         IconButton(
            //           icon: Icon(Icons.add_circle_outline, color: Colors.black),
            //           onPressed: () {},
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            SizedBox(height: 20.0),

            // Badges Section
            SectionHeader(title: 'Badges'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BadgeDetailScreenView(),
                          ),
                        );
                      },
                      child: BadgeItem(
                        title: 'Bronze Award - BCU Graduate+',
                        imageName: "bcuBronzeAward",
                      ),
                    ),
                    SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BadgeDetailScreenView(),
                          ),
                        );
                      },
                      child: BadgeItem(
                        title: 'Silver Award - BCU Graduate+',
                        imageName: "bcuSilverAward",
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20.0),

            // Posts Section
            SectionHeader(title: 'Posts'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UploadedPostDetailsScreenView(),
                        ),
                      );
                    },
                    child: GridViewCardWidget(
                      imagePath: 'assets/images/bcuFB.png',
                      title: index % 2 == 0
                          ? 'Question sets and reports for students'
                          : 'Give feedback - it only takes 2 minutes',
                      likes: 213,
                      postedDate: "Dec 29, 2024",
                      postedBy: "Pardeep Singh",
                      hasLogo: true,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// A Stateless Widget to display a small card with a statistic
class StatCard extends StatelessWidget {
  final String title; // Title of the statistic (e.g., "Followers")
  final String value; // Value of the statistic (e.g., "120K")

  const StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // Light grey background
        borderRadius: BorderRadius.circular(8.0), // Rounded corners
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0), // Spacing between value and title
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey, // Light grey text color
            ),
          ),
        ],
      ),
    );
  }
}

// A Stateless Widget to display section headers with bold text
class SectionHeader extends StatelessWidget {
  final String title; // Title of the section

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold, // Bold font for emphasis
        ),
      ),
    );
  }
}

// A Stateless Widget to display a badge with an image and a title
class BadgeItem extends StatelessWidget {
  final String title; // Badge title
  final String imageName; // Image asset name

  const BadgeItem({required this.title, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.black.withOpacity(.1)), // Light border
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 16.0,
            child: Image.asset(
                "assets/images/${imageName}.png"), // Load image from assets
          ),
          SizedBox(width: 8.0), // Space between image and title
          Text(
            title,
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}

// A Stateless Widget to display a post item with a title, author, and date
class PostItem extends StatelessWidget {
  final String title; // Post title
  final String date; // Post date
  final String author; // Post author

  const PostItem(
      {required this.title, required this.date, required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300), // Light grey border
        borderRadius: BorderRadius.circular(8.0), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold, // Bold title text
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // Truncate text if too long
            ),
            SizedBox(height: 4.0), // Space between title and details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'posted by: $author',
                  style: TextStyle(
                      fontSize: 12.0, color: Colors.grey), // Author text
                ),
                Text(
                  date,
                  style: TextStyle(
                      fontSize: 12.0, color: Colors.grey), // Date text
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
