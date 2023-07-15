import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final List<String> screenNames; // List of screen names for the drawer items
  final int selection; // Index of the selected screen
  final Function(int) onScreenSelected; // Callback function when a screen is selected

  AppDrawer({
    required this.screenNames,
    required this.selection,
    required this.onScreenSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Drawer widget provides a side drawer for navigation
    return Drawer(
      child: ListView(
        children: buildDrawerItems(context), // Build the drawer items with the provided context
      ),
    );
  }

  List<Widget> buildDrawerItems(BuildContext context) { // Build the drawer items with the provided context
    // Generate drawer items based on the screen names
    return List.generate(screenNames.length, (index) {
      return ListTile(
        title: Text(screenNames[index]), // Set the title of the drawer item
        onTap: () {
          onScreenSelected(index); // Call the callback function when a drawer item is tapped
          Navigator.pop(context); // Close the drawer after a drawer item is tapped
        },
        selected: selection == index, // Set the selected state of the drawer item
      );
    });
  }
}
