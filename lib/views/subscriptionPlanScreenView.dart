import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduate_plus/utilities/appColors.dart';
import 'package:graduate_plus/utilities/commonButton.dart';

// Subscription Plan Screen allowing users to select different plans
class SubscriptionPlanScreenView extends StatefulWidget {
  @override
  _SubscriptionPlanScreenViewState createState() =>
      _SubscriptionPlanScreenViewState();
}

class _SubscriptionPlanScreenViewState
    extends State<SubscriptionPlanScreenView> {
  final PageController _pageController =
      PageController(); // Controls page navigation
  int _currentPage = 0; // Tracks the current page index

  final List<String> _titles = ["Basic", "Standard", "Premium"]; // Plan titles

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Upgrade Plan', style: TextStyle(color: blackColor)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon:
              Icon(CupertinoIcons.back, color: blackColor), // Back button icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Plan selection tabs
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _titles.map((title) {
                int index = _titles.indexOf(title);
                return GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: _currentPage == index ? darkBlue : greyColor,
                        ),
                      ),
                      if (_currentPage == index)
                        Container(
                          margin: EdgeInsets.only(top: 4.0),
                          height: 4.0,
                          width: 40.0,
                          color: darkBlue,
                        ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),

          // Subscription Plan details
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                SubscriptionCard(
                  title: 'Basic',
                  description: 'Good for Starter',
                  details: 'There are many variations of Lorem Ipsum available',
                  features: List.generate(
                    5,
                    (index) => 'Lorem ipsum lorem ipsum',
                  ),
                  isActive: _currentPage == 0,
                ),
                SubscriptionCard(
                  title: 'Standard',
                  description: 'Better for Growth',
                  details:
                      'This plan offers additional features and flexibility',
                  features: List.generate(
                    5,
                    (index) => 'Advanced lorem ipsum feature',
                  ),
                  isActive: _currentPage == 1,
                ),
                SubscriptionCard(
                  title: 'Premium',
                  description: 'Best for Professionals',
                  details: 'All features included for maximum value',
                  features: List.generate(
                    5,
                    (index) => 'Premium lorem ipsum feature',
                  ),
                  isActive: _currentPage == 2,
                ),
              ],
            ),
          ),

          // Upgrade button
          Padding(
              padding: EdgeInsets.all(16.0),
              child: commonButton(context: context, label: "UPGRADE NOW")),
        ],
      ),
    );
  }
}

// Widget to display details of each subscription plan
class SubscriptionCard extends StatelessWidget {
  final String title;
  final String description;
  final String details;
  final List<String> features;
  final bool isActive;

  SubscriptionCard({
    required this.title,
    required this.description,
    required this.details,
    required this.features,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: isActive ? darkBlue : greyColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.subscriptions,
            size: screenWidth * 0.2,
            color: isActive ? darkBlue : greyColor,
          ),
          SizedBox(height: 16.0),
          Text(
            description,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: blackColor,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            details,
            style: TextStyle(fontSize: 14.0, color: blackColor.withOpacity(.7)),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.0),
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Icon(Icons.check, color: isActive ? darkBlue : greyColor),
                  SizedBox(width: 8.0),
                  Text(
                    feature,
                    style: TextStyle(fontSize: 14.0, color: blackColor),
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
