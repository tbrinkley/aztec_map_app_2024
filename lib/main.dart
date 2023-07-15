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
        primarySwatch: Colors.red,
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
    'Settings',
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
        title: Text('Aztec App'), // Display the app title in the app bar
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
      case 6:
        return SettingsScreen();
      default:
        return WelcomeScreen();
    }
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'images/background.png', // Replace with your background image path
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              // Top section with image and centered text
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/BHS Front Steps-HDR1.jpg'), // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Aztec App',
                    style: TextStyle(
                      fontFamily: 'BarberOutline',
                      fontSize: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // Next section with two columns
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Text(
                              'Lorem Ipsum',
                              style: TextStyle(
                                fontFamily: 'Arial Narrow',
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                            // Add additional text or widgets as needed
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Text(
                              'Lorem Ipsum',
                              style: TextStyle(
                                fontFamily: 'Arial Narrow',
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                            // Add additional text or widgets as needed
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Row with the "Start" button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add the button functionality
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Start',
                        style: TextStyle(
                          fontFamily: 'Arial Narrow',
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Row with the "Brought to you by:" text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Brought to you by:',
                    style: TextStyle(
                      fontFamily: 'Arial Narrow',
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              // Row with the "Credits" button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // Add the button functionality
                    },
                    child: Text(
                      'Credits',
                      style: TextStyle(
                        fontFamily: 'Arial Narrow',
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              // Scrollable row with three images
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset('images/aztec logo.png'), // Replace with your image path
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset('images/bhs cte logo.png'), // Replace with your image path
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset('images/bhs computer science students logo.png'), // Replace with your image path
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
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

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Settings Screen'), // Display the credits content
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
