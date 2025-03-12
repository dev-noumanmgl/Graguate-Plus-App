import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/utilities/commonButton.dart';
import 'package:graduate_plus/views/academicSuccessScreenView.dart';
import 'package:graduate_plus/views/beyondGraduatePlusScreenView.dart';
import 'package:graduate_plus/views/embeddedCoursesScreenView.dart';
import 'package:graduate_plus/views/employabilityFrameworkScreenView.dart';
import 'package:graduate_plus/views/eventsScreenView.dart';
import 'package:graduate_plus/views/graduateWeekEventsScreenView.dart';
import 'package:graduate_plus/views/graduateWeekVideosScreenView.dart';
import 'package:graduate_plus/views/jiscDiscoveryToolScreenView.dart';
import 'package:graduate_plus/views/messagesScreenView.dart';
import 'package:graduate_plus/views/myContentScreenView.dart';
import 'package:graduate_plus/views/postUploadScreenView.dart';
import 'package:graduate_plus/views/profileScreenView.dart';
import 'package:graduate_plus/views/subscriptionPlanScreenView.dart';

// List of main drawer items with their titles and icons
final List<DrawerItem> mainDrawerItems = [
  DrawerItem(title: "My Content", icon: Icons.folder),
  DrawerItem(title: "Events", icon: Icons.event),
  DrawerItem(title: "New Posts", icon: Icons.post_add),
  DrawerItem(title: "Messages", icon: Icons.message),
  DrawerItem(title: "Premium", icon: Icons.star),
  DrawerItem(title: "My Account", icon: Icons.account_circle),
  DrawerItem(title: "Sign Out", icon: Icons.logout),
];

// Subitems for "Birmingham City University" dropdown in the drawer
final List<String> birminghamSubItems = [
  "Jisc discovery tool",
  "Embedded Courses",
  "Graduate+ Week Events",
  "Graduate+ Week Videos",
  "Centre for Academic Success",
  "Employability Framework",
  "BeyondGraduatePlus",
];

/// Drawer widget displaying navigation options and user profile section.
Widget DrawerViewWidget(BuildContext context) {
  return Drawer(
    backgroundColor: whiteColor,
    shape: Border.all(style: BorderStyle.none), // No border for the drawer
    child: Row(
      children: [
        // Drawer content area taking up 77% of screen width
        Container(
          width: MediaQuery.of(context).size.width * 0.77,
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // Drawer header with logo and profile button
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/bcuLogo.png', // University logo
                      height: 60,
                    ),
                    SizedBox(height: 16.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreenView(),
                          ),
                        );
                      },
                      child: commonButton(context: context, label: "Profile"),
                    ),
                  ],
                ),
              ),

              // ExpansionTile for "Birmingham City University" with subitems
              ExpansionTile(
                shape: Border.all(style: BorderStyle.none),
                leading: Icon(Icons.school), // Leading icon
                title: Text(
                  "Birmingham City University",
                  style: TextStyle(fontSize: 16.0),
                ),
                children: [
                  ...birminghamSubItems.map((subItem) => ListTile(
                        title: Text(
                          subItem,
                          style: TextStyle(fontSize: 14.0),
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pop(); // Close drawer before navigation

                          // Navigate to the appropriate screen based on selected subitem
                          switch (subItem) {
                            case "Jisc discovery tool":
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        JiscDiscoveryToolScreenView(),
                                  ));
                              break;
                            case "Embedded Courses":
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EmbeddedCoursesScreenView(),
                                  ));
                              break;
                            case "Graduate+ Week Events":
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        GraduateWeekEventsScreenView(),
                                  ));
                              break;
                            case "Graduate+ Week Videos":
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        GraduateWeekVideosScreenView(),
                                  ));
                              break;
                            case "Centre for Academic Success":
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AcademicSuccessScreenView(),
                                  ));
                              break;
                            case "Employability Framework":
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EmployabilityFrameworkScreenView(),
                                  ));
                              break;
                            case "BeyondGraduatePlus":
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BeyondGraduatePlusScreenView(),
                                  ));
                              break;
                          }
                        },
                      )),
                ],
              ),

              // Main drawer items mapped into ListTiles
              ...mainDrawerItems.map((item) {
                if (item.title == "My Account") {
                  // Add a divider before "My Account" item
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 16),
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Divider(),
                      ),
                      ListTile(
                        leading: Icon(item.icon, color: Colors.black),
                        title: Text(
                          item.title,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreenView(),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }

                return ListTile(
                  leading: Icon(item.icon, color: Colors.black),
                  title: Text(
                    item.title,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  onTap: () {
                    Navigator.of(context).pop(); // Close the drawer on item tap

                    // Navigate based on the selected main drawer item
                    switch (item.title) {
                      case "My Content":
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyContentScreenView(),
                          ),
                        );
                        break;
                      case "Events":
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventsScreenView(),
                          ),
                        );
                        break;
                      case "New Posts":
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PostUploadScreenView(),
                          ),
                        );
                        break;
                      case "Messages":
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MessagesScreenView(),
                          ),
                        );
                        break;
                      case "Premium":
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubscriptionPlanScreenView(),
                          ),
                        );
                        break;
                    }
                  },
                );
              }).toList(),
            ],
          ),
        ),

        // Transparent area to close drawer when tapped outside
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
            },
            child: Container(
              color: Colors.black.withOpacity(0.5), // Dark overlay effect
            ),
          ),
        ),
      ],
    ),
  );
}

/// Drawer item model representing a title and icon.
class DrawerItem {
  final String title; // Title of the drawer item
  final IconData icon; // Icon representing the drawer item

  DrawerItem({required this.title, required this.icon});
}
