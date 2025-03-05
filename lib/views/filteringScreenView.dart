import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:graduate_plus/utilities/appColors.dart';

// Stateful widget for the Filtering Screen
class FilteringScreenView extends StatefulWidget {
  @override
  _FilteringScreenViewState createState() => _FilteringScreenViewState();
}

class _FilteringScreenViewState extends State<FilteringScreenView> {
  double _fontSize = 16.0; // Variable to control text size
  Color _textColor = Colors.blue; // Variable to control text color

  // Function to open a color picker dialog
  void _pickColor() {
    showDialog(
      context: context,
      builder: (context) {
        Color tempColor = _textColor;
        return AlertDialog(
          title: Text('Select Text Color'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ColorPicker(
                  pickerColor: _textColor,
                  onColorChanged: (color) {
                    tempColor = color;
                  },
                  showLabel: false,
                  pickerAreaHeightPercent: 0.8,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog without changes
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _textColor = tempColor; // Update text color
                });
                Navigator.of(context).pop();
              },
              child: Text('Select'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
              'assets/images/bcuLogo.png',
              height: 40.0,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Text Size Slider
            Text(
              'Text Size',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _fontSize,
              min: 12.0,
              max: 24.0,
              divisions: 6,
              label: _fontSize.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  _fontSize = value;
                });
              },
            ),
            SizedBox(height: 16.0),

            // Sample Text
            Text(
              'Sample',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Give feedback: help make it better\nPlease tell us what you thought of your use of the discovery tool so we can make it better for future users...',
                style: TextStyle(fontSize: _fontSize, color: _textColor),
              ),
            ),
            SizedBox(height: 24.0),

            // Color Picker Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Color',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Sample',
                      style: TextStyle(fontSize: _fontSize, color: _textColor),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: blackColor.withOpacity(.09),
                  child: IconButton(
                    icon: Icon(Icons.edit, color: _textColor),
                    onPressed: _pickColor, // Open color picker
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.0),

            // Sample Text with Color
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Give feedback: help make it better\nPlease tell us what you thought of your use of the discovery tool so we can make it better for future users...',
                style: TextStyle(fontSize: _fontSize, color: _textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
