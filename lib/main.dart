import 'package:flutter/material.dart';
import 'app_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aztec Map',
      theme: ThemeData(
        primarySwatch: Colors.red[800],
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentScreenIndex = 0;

  final List<String> screenNames = [
    'Welcome',
    'Period Timer',
    'Place List',
    'Map',
    'Detail',
    'Credits',
  ];

  void _selectScreen(int index) {
    setState(() {
      _currentScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold widget provides the basic structure for the app's layout
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'), // Display the app title in the app bar
      ),
      drawer: AppDrawer(
        screenNames: screenNames, // List of screen names for the drawer items
        selection: _currentScreenIndex, // Index of the selected screen
        onScreenSelected: _selectScreen, // Callback function when a screen is selected
        context: context, // Pass the context from the widget tree
      ),
      body: _buildCurrentScreen(), // Build the currently selected screen
    );
  }

  Widget _buildCurrentScreen() {
    // Build the appropriate screen based on the current screen index
    switch (_currentScreenIndex) {
      case 0:
        return WelcomeScreen();
      case 1:
        return PeriodTimerScreen();
      case 2:
        return PlaceListScreen();
      case 3:
        return MapScreen();
      case 4:
        return DetailScreen();
      case 5:
        return CreditsScreen();
      default:
        return WelcomeScreen();
    }
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Welcome Screen'), // Display the welcome message
      ),
    );
  }
}

class PeriodTimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Period Timer Screen'), // Display the period timer content
      ),
    );
  }
}

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Place List Screen'), // Display the place list content
      ),
    );
  }
}

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Map Screen'), // Display the map content
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Detail Screen'), // Display the detail content
      ),
    );
  }
}

class CreditsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Credits Screen'), // Display the credits content
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final List<String> screenNames; // List of screen names for the drawer items
  final int selection; // Index of the selected screen
  final Function(int) onScreenSelected; // Callback function when a screen is selected
  final BuildContext context; // The context from the widget tree

  AppDrawer({
    required this.screenNames,
    required this.selection,
    required this.onScreenSelected,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    // Drawer widget provides a side drawer for navigation
    return Drawer(
      child: ListView(
        children: buildDrawerItems(), // Build the drawer items
      ),
    );
  }

  List<Widget> buildDrawerItems() {
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
